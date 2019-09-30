class Ticket < ApplicationRecord
  belongs_to :creator, :class_name => "User"
  alias_attribute :user_id, :creator_id

  belongs_to :assignee, :class_name => "User"
  alias_attribute :user_id, :assignee_id

  has_many :comments
  belongs_to :status
end
