require "rails_helper"

RSpec.describe User, type: :model do

  subject {
    described_class.new(name: "anything",
                        login_id: "12345")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a login_id" do
    subject.login_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a name shorter than 4" do
    subject.name = "hey"
    expect(subject).to_not be_valid
  end

end
