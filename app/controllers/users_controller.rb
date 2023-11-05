# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user
  def profile
    # @user.update(views: @user.views + 1)
    @user.increment!(:views, 1)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.with(user: @user).user_created(@user).deliver_now

      case params[:user][:plan]

      when 'monthly', 'yearly'
        @user.update(role: 'normal_user')
      when 'monthlyprof', 'yearlyprof'
        @user.update(role: 'editor')
      when 'monthlyelite', 'yearlyelite'
        @user.update(role: 'admin')
      end

      # @user.attach_image(params[:user][:userimage])
      redirect_to root_path, notice: 'User created successfully.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def update_subscription
    # Update the user's subscription
    # ...

    # Send the email
    # PostMailer.subscription_updated_email(@user).deliver_now
  end

  private

  def user_params
    params.require(:user).permit(:role, :name, :email, :password, :userimage, :password_confirmation, :current_password,
                                 :profile_image, :plan, :subscription_status, :subscription_ends_at)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
