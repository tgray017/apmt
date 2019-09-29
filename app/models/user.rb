class User < ApplicationRecord
  has_secure_password

  has_many :tickets
  has_many :comments, through: :tickets

  def assigned_tickets
    Ticket.where(:assignee_id => self.id)
  end

  def created_tickets
    Ticket.where(:creator_id => self.id)
  end

end
