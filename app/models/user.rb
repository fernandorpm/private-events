class User < ApplicationRecord

  validates :name, :login_id, presence: true
  validates :name, :login_id, uniqueness: true
  validates :name, :login_id, length: { minimum: 4 }
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "Please enter only letters" }
  validates :login_id, format: { with: /\A[0-9]+\z/, message: "Please enter only numbers" }

  has_many :hoster_events, foreign_key: :hoster_id, class_name: "Event"
  has_many :event_users, foreign_key: :attendee_id
  has_many :attended_events, through: :event_users

end
