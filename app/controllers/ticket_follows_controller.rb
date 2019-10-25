class TicketFollowsController < ApplicationController

  def create
    @ticket_follow = TicketFollow.new(:user_id => current_user.id, :ticket_id => current_ticket.id)
    @ticket_follow.save
    redirect_to ticket_path(current_ticket)
  end

  def destroy
    @ticket_follow = TicketFollow.find_by(:user_id => current_user.id, :ticket_id => current_ticket.id)
    @ticket_follow.destroy
    redirect_to ticket_path(current_ticket)
  end

  def index
  end

  def update
    @ticket_follow = TicketFollow.find_by(:id => params[:id])
    @ticket_follow.update(ticket_follow_params)
    redirect_to ticket_follows_path
  end

  private

    def ticket_follow_params
      params.require(:ticket_follow).permit(:receives_notifications)
    end
end
