# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  before_action :set_notifications, if: :current_user

  private

  def set_notifications
    notification = Notification.where(recipient: current_user).newest_first.limit(9)
    @unread = notification.unread
    @read = notification.read
  end
end
