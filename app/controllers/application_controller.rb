class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :config_permitted_params, if: :devise_controller?

  # project the db, while allowing certain paramaters (whitelist)
  protected
  def config_permitted_params
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :first_name, :last_name, :password, :password_confirmation, :remember_me) }
  	devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :password, :password_confirmation, :current_password) }
  end
end
