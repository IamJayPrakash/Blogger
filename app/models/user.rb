# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  # enum role: %i[admin editor normal_user]

  # username
  validates_length_of :name,
                      minimum: 5, maximum: 50,
                      presence: true,
                      uniqueness: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, format: { with: /\A[a-zA-Z0-9_\s.']+\z/ }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # comments
  has_many :posts, dependent: :destroy
  # has_many :posts, through: :comments, dependent: :destroy

  # depedent : :destroy is used to delete the orphans records (which is created when a linked record is deleted)
  has_many :comments, dependent: :destroy
  # notification
  has_many :notifications, as: :recipient, dependent: :destroy

  acts_as_voter
  # likes
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  # has_one_attached :profile_image
  # user image
  mount_uploader :userimage, AvatarUploader
  validates :userimage, file_size: { less_than: 2.megabytes }

  # stripe
  after_create do
    stripe_customer = Stripe::Customer.create(email: email)
    # stripe_customer_id = stripe_customer.id
    update(stripe_customer_id: stripe_customer.id)
  end

  def active?
    return true if plan == 'lifetime'
    return false unless subscription_ends_at.present?

    subscription_ends_at > Time.zone.now
  end
  # facebook login
  # devise :omniauthable, omniauth_providers: %i[facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end
end
