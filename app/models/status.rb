class Status < ApplicationRecord
  has_many :ticket_statuses
  has_many :tickets, through: :ticket_statuses
end
