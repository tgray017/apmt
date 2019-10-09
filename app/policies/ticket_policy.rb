class TicketPolicy < ApplicationPolicy

  def initialize(user, ticket)
    @user = user
    @ticket = ticket
  end

  def edit?
    @ticket.creator == @user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
