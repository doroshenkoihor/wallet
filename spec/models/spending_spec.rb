require 'rails_helper'

RSpec.describe Spending, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:category) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:description) }
end
