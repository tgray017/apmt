class User < ApplicationRecord
  has_secure_password

  has_many :tickets
  has_many :comments, through: :tickets

  validates :name, presence: true
  validate :email_must_be_valid_if_present

  def email_must_be_valid_if_present
    if email.present? && !email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      errors.add(:email, "must be valid")
    end
  end

  def assigned_tickets
    Ticket.where(:assignee_id => self.id)
  end

  def created_tickets
    Ticket.where(:creator_id => self.id)
  end

  def self.find_or_create_by_omniauth(auth)
    if auth[:provider] == "google_oauth2"
      User.find_or_create_by(:email => auth[:info][:email]) do |u|
        u.name = auth[:info][:name]
        u.password = SecureRandom.hex
      end
    elsif auth[:provider] == "github"
      if auth[:info][:email].nil?
        User.find_or_create_by(:name => auth[:info][:nickname]) do |u|
          u.email = auth[:info][:email]
          u.password = SecureRandom.hex
        end
      else
        User.find_or_create_by(:email => auth[:info][:email]) do |u|
          u.name = auth[:info][:nickname]
          u.password = SecureRandom.hex
        end
      end
    end
  end

end
