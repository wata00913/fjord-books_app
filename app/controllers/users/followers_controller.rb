# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  before_action :set_user, only: %i[index]

  def index
    @follwers = @user.followers
    render 'index'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
