class ApplicationController < ActionController::Base
  before_action :basic_auth

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['sy0306'] && password == ENV['0306']
    end
  end
end
