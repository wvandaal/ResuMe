class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user = session[:token] &&
      User.find_by_session_token(session[:token])
  end

  def logged_in?
    redirect_to root_url unless current_user && 
      (current_user == User.find_by_username(request.subdomain) || current_user == User.find(params[:id]))
  end

  def generate_token
    token = SecureRandom.urlsafe_base64
    while User.find_by_session_token(token)
      token = SecureRandom.urlsafe_base64
    end
    token
  end

  def is_admin?
    redirect_to root_url unless current_user && current_user.admin
  end

  helper_method :current_user
  helper_method :logged_in?
  helper_method :generate_token
  helper_method :is_admin?

end
