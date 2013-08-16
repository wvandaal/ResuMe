class ProjectsController < ApplicationController

	before_filter :logged_in?, except: [:index, :show]

	def index
		@user = User.includes(:projects).find_by_username(request.subdomain)
		@projects = @user.projects.includes(:code_files).paginate(page: params[:page], per_page: 1)
	end

	def new
		@project = Project.new
	end

	def create
		@user = User.find_by_username(request.subdomain)
		@project = @user.projects.build(params[:project])
		if @project.save
			if request.xhr?
				render @project
			else
				redirect_to code_url(subdomain: @user.username)
			end
		else
			flash.now[:errors] = @project.errors.full_messages
			if request.xhr?
				render partial: "layouts/errors"
			else
				render :new
			end
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@user = User.find_by_username(request.subdomain)
		@project = Project.find(params[:id])
		if @project.update_attributes(params[:project])
			if request.xhr?
				render @project
			else
				redirect_to code_url(subdomain: @user.username)
			end
		else
			flash.now[:errors] = @project.errors.full_messages
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
