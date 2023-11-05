# frozen_string_literal: true

class SendEmailsJob < ApplicationJob
  queue_as :default

  def perform
    UserMailer.user_created.deliver
    # Do something later
  end
end
