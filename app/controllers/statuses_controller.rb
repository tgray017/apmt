class StatusesController < ApplicationController

  def show
    @status = Status.find(params[:id])
    @tickets = Ticket.where(:status_id => @status.id)
  end
end
