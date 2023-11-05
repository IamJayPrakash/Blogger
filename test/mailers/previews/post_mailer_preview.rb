# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/post_mailer/post_created
  def post_created
    PostMailer.with(user: User.first, post: Post.first).post_created
  end
end
