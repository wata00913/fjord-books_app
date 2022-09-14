# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  before_action :set_other, only: %i[create destroy]

  # POST users/:user_id/followings
  def create
    if current_user.follow(@other)
      redirect_to @other, notice: 'フォローしました'
    else
      redirect_to @other, flash: { alert: set_first_message_to_flash(current_user, :id) }
    end
  end

  # DELETE users/followings/1
  def destroy
    if current_user.unfollow(@other)
      redirect_to @other, notice: 'フォロー解除しました'
    else
      redirect_to @other, flash: { alert: set_first_message_to_flash(current_user, :id) }
    end
  end

  private

  def set_other
    @other = User.find(params[:id])
  end

  def set_first_message_to_flash(model, attribute)
    model.errors.where(attribute).first.message
  end
end
