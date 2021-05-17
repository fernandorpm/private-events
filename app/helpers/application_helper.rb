module ApplicationHelper
    def require_login
        if current_user.nil?
            redirect_to login_path, notice: 'not signed in, Sign in'
        end
            
    end

    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        end
    end

end
