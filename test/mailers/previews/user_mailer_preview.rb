# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/user_created
  def user_created
    # UserMailer.user_created
    UserMailer.with(user: User.first).user_created
  end
end
