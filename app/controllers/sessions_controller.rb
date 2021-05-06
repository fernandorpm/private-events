class SessionsController < ApplicationController
  def login
    
  end

  def logged_in
    user_param
  end

  def logout
    session.clear
    redirect_to users_path
  end
  
  private

  def user_param
    lf = params[:login_field]
    
    if lf =~ /\d/
      @user = User.where(login_id: lf)
    else
      @user = User.where(name: lf)
    end

    if @user.empty?
      redirect_to login_path
    else
      session[:login_id] = @user.first.login_id
      session[:name] = @user.first.name
      redirect_to users_path
    end

  end
end