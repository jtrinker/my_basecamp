class ProjectsController < ApplicationController
  def index
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
  	@project = Project.find(params[:id])
  end

  private

  def project_params
  	params.require(:project).permit(:name, :description)
  end
end
