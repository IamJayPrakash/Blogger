# frozen_string_literal: true

class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError

  after_enqueue :send_user_created

  private

  def send_user_created
    return unless record.is_a?(User)

    SendEmailsJob.perform_after(self)
  end
end
