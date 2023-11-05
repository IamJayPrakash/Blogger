# frozen_string_literal: true

module Stripe
  class WebhooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
      # Replace this endpoint secret with your endpoint's unique secret
      # If you are testing with the CLI, find the secret by running 'stripe listen'
      # If you are using an endpoint defined with the API or dashboard, look in your webhook settings
      # at https://dashboard.stripe.com/webhooks
      webhook_secret = 'whsec_5ff58499fea121729b872fc44727f1c17ffaa2d175b6a5fa999b54795742e3f2'

      payload = request.body.read
      if !webhook_secret.empty?
        # Retrieve the event by verifying the signature using the raw body and secret if webhook signing is configured.
        sig_header = request.env['HTTP_STRIPE_SIGNATURE']
        event = nil

        begin
          event = Stripe::Webhook.construct_event(
            payload, sig_header, webhook_secret
          )
        rescue JSON::ParserError
          # Invalid payload
          status 400
          return
        rescue Stripe::SignatureVerificationError
          # Invalid signature
          puts '⚠️  Webhook signature verification failed.'
          status 400
          return
        end
      else
        data = JSON.parse(payload, symbolize_names: true)
        event = Stripe::Event.construct_from(data)
      end
      # Get the type of webhook event sent - used to check the status of PaymentIntents.
      event['type']
      data = event['data']
      data['object']

      case event.type
      when 'customer.created'
        customer = event.data.object
        user = User.find_by(email: customer.email)
        user.update(stripe_customer_id: customer.id)
      when 'customer.subscription.deleted', 'customer.subscription.updated', 'customer.subscription.created'
        subscription = event.data.object
        # debugger
        user = User.find_by(stripe_customer_id: subscription.customer)
        user.update(
          plan: subscription.items.data[0].price.lookup_key,
          subscription_status: subscription.status,
          subscription_ends_at: Time.at(subscription.current_period_end).to_datetime
        )

        case subscription.items.data[0].price.lookup_key

        when 'monthly', 'yearly'
          user.update(role: 'normal_user')
        when 'monthlyprof', 'yearlyprof'
          user.update(role: 'editor')
        when 'monthlyelite', 'yearlyelite'
          user.update(role: 'admin')
        end

      when 'checkout.session.completed'
        session = event.data.object
        # handle one time payment
        if session.mode == 'payment' && session.payment_status == 'paid'
          user = User.find_by(stripe_customer_id: session.customer)
          session_with_line_items = Stripe::Checkout::Session.retrieve({ id: session.id, expand: ['line_items'] })
          plan = session_with_line_items.line_items.data.first.price.lookup_key # "lifetime"
          user.update(plan: plan)

          case plan
          when 'monthly', 'yearly'
            user.update(role: 'normal_user')
          when 'monthlyprof', 'yearlyprof'
            user.update(role: 'editor')
          when 'monthlyelite', 'yearlyelite'
            user.update(role: 'admin')
          end
        end
      end
      render json: { message: 'success' }
    end
    # us_OgQvTrHSVyoBh7
  end
end
