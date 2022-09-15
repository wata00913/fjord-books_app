# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  before_action :set_other, only: %i[index]

  # GET users/:user_id/followers
  def index
    @follwers = @other.followers
    render 'index'
  end

  private

  def set_other
    @other = User.find(params[:id])
  end
end
