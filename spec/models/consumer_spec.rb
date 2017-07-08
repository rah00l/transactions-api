require 'rails_helper'

RSpec.describe Consumer, type: :model do
	# Test association
  # ensure Consumer model has a m:m relationship with the Merchant model through transactions
  it { should have_many(:transactions) }
  it { should have_many(:merchants).dependent(:destroy) }
end
