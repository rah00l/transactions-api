class Consumer < ApplicationRecord
	# Associations
	has_many :transactions
	has_many :merchants, through: :transactions, dependent: :destroy
end
