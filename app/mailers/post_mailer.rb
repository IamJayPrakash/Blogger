# frozen_string_literal: true

class PostMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_created.subject
  #
  # default from: 'jay.prakash@ksolves.com'

  # def welcome_email
  #   @user = params[:user]
  #   @url  = 'http://example.com/login'
  #   mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  # end

  def post_created
    @user = params[:user]
    # @post = Post.first

    @greeting = 'your post was created successfully .'
    attachments['emailpic.png'] = File.read('app/assets/images/emailpic.png')
    mail(
      # from: 'jay.prakash@ksolves.com',
      to: @user.email,
      # cc: User.all.pluck(:email),
      bcc: 'jay.prakash@ksolves.com',
      subject: 'Post created successfully'
    )
  end
end
