class Ticket < ApplicationRecord
  belongs_to :creator, :class_name => "User"
  alias_attribute :user_id, :creator_id

  belongs_to :assignee, :class_name => "User"
  alias_attribute :user_id, :assignee_id

  has_many :comments
  belongs_to :status

  has_many :user_tickets
  has_many :watchers, through: :user_tickets, source: :user

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true
end
