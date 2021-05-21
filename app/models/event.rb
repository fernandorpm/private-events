class Event < ApplicationRecord
  validates :event_name, :event_date, :event_location, presence: true
  # validates :event_name, uniqueness: true
  validates :event_name, :event_location, length: { minimum: 4 }

  belongs_to :hoster, class_name: 'User'
  has_many :event_users, foreign_key: :attended_event_id
  has_many :attendees, through: :event_users, foreign_key: :attendee_id

  scope :past, -> { where('event_date < ?', Date.today).order(event_date: :desc) }
  scope :future, -> { where('event_date > ?', Date.today).order(:event_date) }
end
