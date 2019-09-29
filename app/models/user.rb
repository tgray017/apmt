class User < ApplicationRecord
  has_many :tickets

  def assigned_tickets
    Ticket.where(:assignee_id => self.id)
  end

  def created_tickets
    Ticket.where(:creator_id => self.id)
  end

end
