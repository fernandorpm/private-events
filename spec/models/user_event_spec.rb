require "rails_helper"

RSpec.describe UserEvent, type: :model do
  
  subject {
    User.create!(name: "myuser",login_id: "12345")
    Event.create!(event_name: "newevent", 
      event_location: "At the hall", 
      event_date: Date.parse('2020-7-27'),
       hoster_id: 1)
    described_class.new(user_id: 1, event_id: 1)
  }

  it "is valid and has valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid because it has no user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid because it has no event_id" do
    subject.event_id = nil
    expect(subject).to_not be_valid
  end

end
