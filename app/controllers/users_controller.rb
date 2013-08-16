class UsersController < ApplicationController

  before_filter :logged_in?, only: [:edit]
  before_filter :is_admin?, only: [:control_panel]

	def index
		@users = User.all
	end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url(subdomain: @user.username)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by_username(request.subdomain)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    if params[:old_password] && @user.authenticate(params[:old_password])
      @user.update_attributes(password: params[:password],
        password_confirmation: params[:password_confirmation])
    end
    if request.xhr?

    else
      redirect_to edit_user_url(@user)
    end
  end

  def control_panel

  end

end
