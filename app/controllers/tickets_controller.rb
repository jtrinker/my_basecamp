class TicketsController < ApplicationController
	before_action :get_project 
  before_action :get_ticket, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  	@ticket = @project.tickets.build
    # By defining a has_many association in the project model we get a whole 
    # slew of useful methods, such as the build method, which you are currently 
    # calling in the new action of TicketsController. The build method is equivalent 
    # to new for the Ticket class but associates 
    # the new object instantly with the @project object by setting a foreign key called 
    # project_id automatically.
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    if @ticket.save
      flash[:notice] = "Ticket has been created"
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket was not created"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render action: 'edit'
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been deleted."

    redirect_to @project
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end

  def get_project
  	@project = Project.find(params[:project_id])
 	end

  def get_ticket
    @ticket = @project.tickets.find(params[:id])
  end
end
