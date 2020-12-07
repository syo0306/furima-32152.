class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth


  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'sy0306' && password == '0306'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :first_name, :first_name_kana, :last_name, :last_name_kana, :birth_day])
  end
end
