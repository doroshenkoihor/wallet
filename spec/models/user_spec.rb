require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    User.create(
      name: "Bob",
      email: "bob@bob.com",
      password: "bob",
      password_confirmation: "bob"
    )
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }

  it { should validate_uniqueness_of(:email) }
  it { is_expected.to have_many(:spendings) }
end
