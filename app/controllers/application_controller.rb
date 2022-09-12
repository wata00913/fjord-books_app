# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[post_code address self_introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[post_code address self_introduction])
  end

  private

  # デフォルトではルートパスを返すのでログイン画面を指定。
  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end
