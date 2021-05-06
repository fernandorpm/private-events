module ApplicationHelper
  def logged_user
    if session[:name].nil?
      return "You are not logged in"
    else
      return "Logged in as: " + session[:name]
    end
  end
end
