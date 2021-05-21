require_relative 'rails_helper'
RSpec.describe Event, type: :model do
  subject do
    described_class.new(event_name: 'party and party',
                        event_location: 'At the hall',
                        event_date: Date.parse('2020-7-27'),
                        hoster_id: 1)
  end

  it 'name, date and location must be present' do
    subject.event_name = ''
    subject.event_location = ''
    subject.event_date = ''
    expect(subject).to_not be_valid
  end

  it 'event name has to be unique' do
    subject.save
    another_event = described_class.new(event_name: 'party and party',
                                        event_location: 'At the church',
                                        event_date: Date.parse('2010-7-27'),
                                        hoster_id: 2)
    expect(another_event).to_not be_valid
  end

  it 'is not valid with a name shorter than 4' do
    subject.event_name = 'nap'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a location shorter than 4' do
    subject.event_location = 'cap'
    expect(subject).to_not be_valid
  end
end
