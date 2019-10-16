class Status < ApplicationRecord
  has_many :tickets

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
end
