class Event < ApplicationRecord

  validates :event_name, :event_date, :event_location, presence: true
  validates :event_name, uniqueness: true
  validates :event_name, :event_location, length: { minimum: 4 }

  has_many :user_events, foreign_key: :event_id
  has_many :users, through: :user_events
  belongs_to :hoster, class_name: "User"

end
