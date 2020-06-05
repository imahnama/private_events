class Event < ApplicationRecord
  scope :upcoming_scope, -> { where('date >= ?', DateTime.now.to_date) }
  scope :previous_scope, -> { where('date < ?', DateTime.now.to_date) }
  belongs_to :creator, class_name: "User"
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees, source: :attendee

  def self.upcoming
    Event.upcoming_scope
  end

  def self.previous
    Event.previous_scope
  end
end
