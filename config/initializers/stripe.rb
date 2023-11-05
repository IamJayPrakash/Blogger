# frozen_string_literal: true

Rails.configuration.stripe = {
  publishable_key: 'pk_test_51NrzBpSFVzh5Krmi4gbswcWb7xJY7IS4jXPJLY35G13UhmQQpu1aKPcJsv81ox4ZvkSaeoNwxQcX2mwFslPHwx9z00LNKrQLoZ',
  secret_key: 'sk_test_51NrzBpSFVzh5KrmiC1dHcvwi1hG53QNhcMSifNpBTNYycVOAytTkslVqGIttnO4oSSK4VfcmHv8Y9EVCycL6vMib00vzstC2QS'
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
