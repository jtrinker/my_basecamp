class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
  	@projects = Project.all
  end

  def new
  	@project = Project.new
  end

  def create
  	@project = Project.new(project_params)
  	# params = the attrs passed in by the form and OK'd by strong parameters

  	if @project.save
  		flash[:notice] = "Project has been created."
  		redirect_to @project
  	else
  		flash[:error] = "Project failed to save."
  		render "new"
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @project.update(project_params)
			flash[:notice] = "Project has been updated."
  		redirect_to @project
  	else
  		flash[:error] = "Project failed to update."
  		render "edit"
  	end
 	end

 	def destroy
 		@project.destroy

 		flash[:notice] = "Project deleted."
 		redirect_to projects_path
 	end

  private

  def project_params
  	params.require(:project).permit(:name, :description)
  end

  def set_project
  	@project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  	flash[:error] = "The project you were looking for could not be found."
  	redirect_to projects_path
  end
end
