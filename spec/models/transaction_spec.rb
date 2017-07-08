require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should belong_to(:consumer) }
  it { should belong_to(:merchant) }
end
