# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  before_action :set_other, only: %i[index create destroy]

  # GET users/:user_id/followings
  def index
    @followed_users = @other.followings
    render 'index'
  end

  # POST users/:user_id/followings
  def create
    if current_user.follow(@other)
      redirect_to @other, notice: t('.notice')
    else
      redirect_to @other, flash: { alert: first_error_message(current_user, :id) }
    end
  end

  # DELETE users/followings/1
  def destroy
    if current_user.unfollow(@other)
      redirect_to @other, notice: t('.notice')
    else
      redirect_to @other, flash: { alert: first_error_message(current_user, :id) }
    end
  end

  private

  def set_other
    @other = User.find(params[:id])
  end

  def first_error_message(model, attribute)
    model.errors.where(attribute).first.message
  end
end
