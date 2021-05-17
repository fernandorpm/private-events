class Event < ApplicationRecord

  validates :event_name, :event_date, :event_location, presence: true
  # validates :event_name, uniqueness: true
  validates :event_name, :event_location, length: { minimum: 4 }

  belongs_to :hoster, class_name: 'User'
  has_many :user_events, foreign_key: :attended_event_id
  # has_many :attend, dependent: :destroy
  has_many :users, through: :user_events, class_name: 'User'

end
