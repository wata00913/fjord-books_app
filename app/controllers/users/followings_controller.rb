# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  before_action :set_user, only: %i[index create destroy]

  # GET users/:user_id/followings
  def index
    @followed_users = @user.followings
    render 'index'
  end

  # POST users/:user_id/followings
  def create
    if current_user.follow(@user)
      redirect_to @user, notice: t('.notice')
    else
      redirect_to @user, flash: { alert: first_error_message(current_user, :id) }
    end
  end

  # DELETE users/followings/1
  def destroy
    if current_user.unfollow(@user)
      redirect_to @user, notice: t('.notice')
    else
      redirect_to @user, flash: { alert: first_error_message(current_user, :id) }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def first_error_message(model, attribute)
    model.errors.where(attribute).first.message
  end
end
