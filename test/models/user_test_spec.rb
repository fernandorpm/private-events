require "test_helper"

class UserTest < ActiveSupport::TestCase
  RSpec.describe User, :type => :model do
    context "with 2 or more users" do
      it "orders them in reverse chronologically" do
        user = User.create!
        user1 = user.create!(name: "first user", login_id: "12345")
        user2 = user.create!(login_id: "34567")
        expect(user.reload.comments).to eq([user2, user1])
      end
    end
  end
end
