require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'anything',
                        login_id: '12345')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a login_id' do
    subject.login_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name shorter than 4' do
    subject.name = 'hey'
    expect(subject).to_not be_valid
  end

  it 'should not have the same name with a user' do
    another_user = described_class.new(name: 'anything', login_id: '12333')
    subject.save
    expect(another_user).to_not be_valid # because there is another name of "anything on the database"
  end

  it 'should not accept a number for the name' do
    subject.name = '123434'
    expect(subject).to_not be_valid
  end

  it 'should not accept letters for the login_id' do
    subject.login_id = 'abcde'
    expect(subject).to_not be_valid
  end
end
