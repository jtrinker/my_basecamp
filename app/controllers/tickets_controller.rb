class TicketsController < ApplicationController
	before_action :get_project

  def index
  end

  def new
  	@ticket = @project.tickets.build
  end

  def create
  end

  private

  def get_project
  	@project = Project.find(params[:project_id])
 	end
end
