require 'rails_helper'

RSpec.describe User, type: :model do
	it "with valid attributes" do
		user = User.new(
			first_name: Faker::Name.first_name,
			last_name: Faker::Name.last_name,
			age: Faker::Number.number(2),
			gender: Faker::Gender.binary_type
			)

		expect(user).to be_valid
	end

	it "first name and last name cannot be empty" do
		user = User.new(
			first_name: "",
			last_name: "",
			age: Faker::Number.number(2),
			gender: Faker::Gender.binary_type
			)

		expect(user).not_to be_valid
	end

	it "An age field that has to be positive integer" do
		user = User.new(
			first_name: Faker::Name.first_name,
			last_name: Faker::Name.last_name,
			age: Faker::Number.negative,
			gender: Faker::Gender.binary_type
			)

		expect(user).not_to be_valid
	end

	it "A gender field that can be one of 'male', 'female' or 'others'" do
		user = User.new(
			first_name: Faker::Name.first_name,
			last_name: Faker::Name.last_name,
			age: Faker::Number.number(2),
			gender: Faker::Name.male_first_name
			)

		expect(user).not_to be_valid		
	end

	it { is_expected.to embed_one :shop }
end
