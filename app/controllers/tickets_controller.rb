class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
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
