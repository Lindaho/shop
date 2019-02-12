class User < ApplicationRecord
	include Mongoid::Document
  	field :first_name, type: String
  	field :last_name, type: String
  	field :gender, type: String
  	field :age, type: Integer
  	field :country, type: String
  	field :address_1, type: String
  	field :address_2, type: String
	
	validates :first_name, :last_name, presence: true
	validates :gender, inclusion: { in: %w(male female other), message: "%{value} is not valid." }
    validates :age, numericality: { greater_than: 0 }


	def address
		{ country: country, address_1: address_1, address_2: address_2 }
	end
end
