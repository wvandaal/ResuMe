class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      @user.update_attributes!(session_token: generate_token)
      session[:token] = @user.session_token
      redirect_to root_url(subdomain: @user.username)
    else
      flash.now[:errors] = ["invalid username/password"]
      render :new
    end
  end

  def destroy
    user = User.find_by_session_token(session[:token])
    user.update_attributes(session_token: nil)
    session[:token] = nil

    redirect_to root_url
  end


end
