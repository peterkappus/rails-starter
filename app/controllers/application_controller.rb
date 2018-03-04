class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #now using devise
  #unless  ENV['RAILS_ENV'] == 'test' || ENV['RAILS_ENV'] == 'development'
  #  http_basic_authenticate_with name: ENV['BASIC_AUTH_USER'], password: ENV['BASIC_AUTH_PASS']
  #end

  helper_method :is_admin?, :check_admin

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def is_admin?
    current_user.present? && current_user.admin? #signed_in? && current_user.admin?
  end

  def check_admin
    if !current_user.admin?
      flash['error'] = "The action you've requested requires admin privileges. "
      redirect_to root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :admin])
  end
end
