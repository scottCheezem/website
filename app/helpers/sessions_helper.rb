module SessionsHelper

  def log_in(user)
    if user[:active]
      session[:user_id] = user.id
      return true
    else
      return false
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      return nil
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
