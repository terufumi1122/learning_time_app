class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :current_user
  # before_action :login_required

  private

  def logged_in?
    !current_user.nil?
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # def login_required
  #   redirect_to login_path unless current_user
  # end

end
