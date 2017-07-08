class Merchant < ApplicationRecord
	# Associations
	has_many :transactions
	has_many :consumers, through: :transactions, dependent: :destroy
end
