class FilesController < ApplicationController

	def show
		@user = User.find_by_username(request.subdomain)
		@file = CodeFile.find(params[:id])
		@project = @file.project(includes: :code_files)
		# if request.xhr?
		# 	render partial: "file", locals: {file: @file}
		# end
	end

	def new
		@project = Project.find(params[:project_id])
		@file = CodeFile.new
	end

	def create
		@user = User.find_by_username(request.subdomain)
		@project = Project.find(params[:project_id])
		@file = @project.code_files.build(params[:code_file])
		if @file.save!
			if request.xhr?
				render partial: "projects/project", locals: {project: @project}
			else
				redirect_to code_url(subdomain: @user.username)
			end
		else
			flash.now[:errors] = @file.errors.full_messages
			if request.xhr?
				render partial: "layouts/errors"
			else
				render :new
			end
		end
	end
end
