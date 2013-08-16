class DegreesController < ApplicationController

	before_filter :logged_in?, except: [:index]

  def index
    @user = User.includes(:schools).find_by_username(request.subdomain)
    @schools = @user.schools.includes(:degrees).uniq
  end

  def new
  	@degree = Degree.new
  end

  def create
  	@user = User.find_by_username(request.subdomain)
  	@degree = @user.degrees.build(params[:degree])
  	if degree.save
  		if request.xhr?
  			render partial: "degree", locals: {degree: @degree}
  		else
  			redirect_to education_url(subdomain: current_user.username)
  		end
  	else
  		flash.now[:errors] = @degree.errors.full_messages
  		if request.xhr?
        render partial: "layouts/errors"
      else
        render :new
      end
  	end
  end

  def edit
  	@degree = Degree.find(params[:id])
  end

  def update
  	@user = User.find_by_username(request.subdomain)
  	@degree = Degree.find(params[:id])
		if @degree.update_attributes(params[:degree])
      if request.xhr?
        render partial: "degree", locals: {degree: @degree}
      else
        redirect_to education_url(subdomain: @user.username)
      end
    else
      flash.new[:errors] = @degree.errors.full_messages
      if request.xhr?
        render partial: "layouts/errors"
      else
        render :edit
      end
    end
  end

  def destroy

  end

end
