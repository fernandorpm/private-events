class UserEvent < ApplicationRecord

  validates :user_id, :event_id, presence: true

  belongs_to :hoster, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

end
