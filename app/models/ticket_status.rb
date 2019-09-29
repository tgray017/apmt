class TicketStatus < ApplicationRecord
  belongs_to :ticket
  belongs_to :status
end
