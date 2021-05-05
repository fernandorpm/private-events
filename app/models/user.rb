class User < ApplicationRecord

  validates :name, :login_id, presence: true
  validates :name, :login_id, uniqueness: true
  validates :name, :login_id, length: { minimum: 4 }
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "Please enter only letters" }
  validates :login_id, format: { with: /\A[0-9]+\z/, message: "Please enter only numbers" }

  has_many :user_events, foreign_key: :user_id
  has_many :events, through: :user_events
  has_many :hosted_events, foreign_key: :hoster_id, class_name: "Event"

end
