module ApplicationHelper
  def require_login
    redirect_to login_path, notice: 'not signed in, Sign in' if current_user.nil?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
