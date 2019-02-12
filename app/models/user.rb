class User < ApplicationRecord
	def address
		{country: country, address_1: address_1, address_2: address_2}
	end
end
