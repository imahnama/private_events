class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :event_attendees, foreign_key: :attendee_id
  has_many :attended_event, through: :event_attendees, source: :attended_event

  validates :name, presence: true, length: { in: 3..20 },
                   uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 244 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  def upcoming_events
    events.where('date >= ?', DateTime.now)
  end

  def previous_events
    events.where('date < ?', DateTime.now)
  end
end
