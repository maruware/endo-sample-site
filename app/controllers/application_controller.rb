class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :basic_auth

  def basic_auth
    authenticate_or_request_with_http_basic do |user, pass|
      user == 'user' && pass == 'pass'
    end
  end

  def current_user
    @current_user ||= User.find_by(token: params[:token])
  end

  helper_method :current_user
end
