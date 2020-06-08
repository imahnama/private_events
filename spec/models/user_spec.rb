require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_length_of(:name).is_at_least(3) }
  end

  describe 'associations' do
    it { should have_many(:events).class_name('Event').with_foreign_key(:creator_id) }
    it { should have_many(:attended_event).through(:event_attendees) }
    it { should have_many(:event_attendees).with_foreign_key(:attendee_id) }
  end
end
