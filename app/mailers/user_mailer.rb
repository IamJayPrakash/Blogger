# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_created.subject
  #

  def user_created(user)
    @user = user
    @greeting = 'Hi New User , enjoy your blogging Journey'
    params[:user]
    attachments['default_image.jpeg'] = File.read('app/assets/images/default_image.jpeg')
    mail(
      # from: 'jay.prakash@ksolves.com',
      to: @user.email,
      # cc: User.all.pluck(:email),
      bcc: 'jay.prakash@ksolves.com',
      subject: 'User created successfully'
    )
  end
end
