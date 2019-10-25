class TicketPolicy < ApplicationPolicy

  def initialize(user, ticket)
    @user = user
    @ticket = ticket
  end

  def edit?
    @user == @ticket.creator || @user == @ticket.assignee
  end

  def update?
    edit?
  end

  def destroy?
    @user == @ticket.creator
  end
end
