class User < ApplicationRecord

  validates :name, :login_id, presence: true
  validates :name, :login_id, uniqueness: true
  validates :name, :login_id, length: { minimum: 4 }
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "Please enter only letters" }
  validates :login_id, format: { with: /\A[0-9]+\z/, message: "Please enter only numbers" }

  has_many :hosted_events, foreign_key: :hoster_id class_name: "Event"
  has_many :user_events, foreign_key: :user_id
  has_many :attended_events, through: :user_events

end

# event_name: 'c1 event', event_location: 'c1 location', event_date: DateTime.now

# user <> UserEvent <> Event

# user has_many userevent
#   has_many event through userEvent


# userEvent  belongs_to User
#           belongs_to Event

# Event has_many userEvent
#       belongs_to hoster
#       has_many attendees through userEvent