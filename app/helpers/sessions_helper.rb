module SessionsHelper

  def log_in(user)
    if user[:active]
      session[:user_id] = user.id
      User.current_user = user
      return true
    else
      return false
    end
  end

  def log_out
    session.delete(:user_id)
    User.current_user = nil
    @current_user = nil
  end

  def current_user
    if User.current_user
      @current_user ||= User.current_user
    else
      return nil
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
