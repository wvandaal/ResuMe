class SchoolsController < ApplicationController

  before_filter :is_admin?

  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(params[:school])
    if @school.save
      if request.xhr?
        render partial: "school", locals: {school: @school}
      else
        redirect_to schools_url
      end
    else
      flash.now[:errors] = @school.errors.full_messages
      if request.xhr?
        render partial: "layouts/errors"
      else
        render :new
      end
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update_attributes(params[:school])
      if request.xhr?
        render partial: "school", locals: {school: @school}
      else
        redirect_to schools_url
      end
    else
      flash.now[:errors] = @school.errors.full_messages
      if request.xhr?
        render partial: "layouts/errors"
      else
        render :edit
      end
    end
  end

  def destroy
    school = School.find(params[:id])
    school.destroy

    redirect_to schools_url
  end
end
