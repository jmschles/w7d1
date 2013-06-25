class SessionsController < ApplicationController

  def create
    @user = User.find_by_username(params[:user][:username])
    if @user && @user.verify_password(params[:user][:password])
      session[:session_token] = @user.reset_session_token
      redirect_to user_photos_url(@user.id)
    else
      @user = User.new(params[:user])
      render :new
    end
  end

  def new
    @user = User.new
  end

end
