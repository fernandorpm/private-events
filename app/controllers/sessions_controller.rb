class SessionsController < ApplicationController
  def login
   @user
  end

  def logged_in
    user_param
  end

  def logout

  end
  
  private
  def set_name
      
  end

  def user_param
    lf = params[:login_field]
    if lf =~ /\d/
      begin
        @user = User.find(login_id: lf).first
        p "======================"
        p @user.name
        session[:login_id] = @user.login_id
        session[:name] = @user.name
        redirect_to users_path

        # save session
      rescue
        # redirect to login
        redirect_to sessions_login_path
      end
    else
      begin
        @user = User.find(name: lf).first
        session[:login_id] = @user.login_id
        session[:name] = @user.name
        redirect_to users_path

        # save session
      rescue
        # redirect to login
        redirect_to sessions_login_path
      end
    end
  end
end