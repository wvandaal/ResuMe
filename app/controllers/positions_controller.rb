class PositionsController < ApplicationController

	before_filter :logged_in?, except: [:index]

	def index
		@user = User.find_by_username(request.subdomain)
		@positions = @user.positions.includes(:company).order('start_date DESC')
	end

	def edit
		@position = Position.find(params[:id])
	end

	def update
		@user = User.find_by_username(request.subdomain)
		@position = Position.find(params[:id])
		if @position.update_attributes(params[:position])
			if request.xhr?
				render partial: "position", locals: { position: @position }
			else
				redirect_to employment_url(subdomain: @user.username)
			end
		else
			flash.now[:errors] = @position.errors.full_messages
			if request.xhr?
				render partial: "layouts/errors"
			else
				render :edit
			end
		end
	end

	def new
		@position = Position.new
		@position.build_company
	end

	def create
		@user = User.find_by_username(request.subdomain)
		@position = @user.positions.build(params[:position])
		if @position.save
			if request.xhr?
				render partial: "position", collection: @user.positions 
			else
				redirect_to employment_url(subdomain: @user.username)
			end
		else
			flash.now[:errors] = @position.errors.full_messages
			if request.xhr?
				render partial: "layouts/errors"
			else
				render :new
			end
		end
	end

	def destroy
		user = User.find_by_username(request.subdomain)
		position = Position.find(params[:id])
		position.destroy
		if request.xhr?
			render partial: "position", collection: user.positions
		else
			redirect_to education_url(subdomain: user.username)
		end
	end

end
