require 'rails_helper'

RSpec.describe Merchant, type: :model do
  # Test association
  # ensure Merchant model has a m:m relationship with the Consumer model through transactions
  it { should have_many(:transactions) }
  it { should have_many(:consumers).dependent(:destroy) }
end
