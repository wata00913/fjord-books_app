# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  DEFULAT_PER_PAGE = 25

  def index
    @users = User.order(:id).page(params[:page]).per(DEFULAT_PER_PAGE)
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
