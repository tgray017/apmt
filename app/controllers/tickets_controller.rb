class TicketsController < ApplicationController
  def index
    if @user = User.find_by(:id => params[:user_id])
      @tickets = @user.tickets
    else
      @tickets = Ticket.all
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render :new # set a flash message
    end
  end

  private

    def ticket_params
      params.require(:ticket).permit(:creator_id, :title, :description, :status_id, :assignee_id, :due_date)
    end
end
