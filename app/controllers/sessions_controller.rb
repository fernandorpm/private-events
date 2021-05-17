class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        user = User.find_by(name: params[:name])
        if user
            log_in(user)
            redirect_to events_path, notice: "logged in successfully!"
        else
            render 'new', notice: "User not found"
        end

    end


    def destroy
        session[:user_id] = nil
        redirect_to root_url, notice: 'You are logged out!'
    end
 
    private 
    def sign_param
        params.require(:session).permit(:name)
    end

    def search
        params[:id]
    end
end
