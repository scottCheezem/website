class ApplicationController < ActionController::Base
  include Pundit
  include SessionsHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'application'

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_filter do
    if session[:user_id]
      User.current_user = User.find(session[:user_id])
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
