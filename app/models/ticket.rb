class Ticket < ApplicationRecord

  scope :due_this_week, -> { where('due_date <= ?', Time.now + 1.week) }
  scope :past_due, -> { where('due_date <= ?', Time.now) }

  belongs_to :assignee, :class_name => "User", :foreign_key => "assignee_id"
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"

  has_many :comments
  belongs_to :status

  has_many :ticket_follows
  has_many :followers, through: :ticket_follows, source: :user

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true
end
