class User < ApplicationRecord
	validates :first_name, :last_name, presence: true
	validates :gender, inclusion: { in: %w(male female other), message: "%{value} is not valid." }
    validates :age, numericality: { greater_than: 0 }


	def address
		{country: country, address_1: address_1, address_2: address_2}
	end
end
