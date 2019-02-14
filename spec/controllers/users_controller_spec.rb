require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	
	describe "GET #index" do
		it "should assigns all users to @users" do
			users = FactoryBot.create_list(:user, 10)
			get :index		
			expect(assigns(:users).to_a).to eq users
			expect(response).to have_http_status(:success)
		end
	end

	describe "GET #show" do
		it "should assigns user to @user" do
			user = FactoryBot.create(:user)			
			get :show, params: { id: user }
			expect(assigns(:user)).to eq user
			expect(response).to have_http_status(:success)
		end
	end

	describe "POST #create" do
		it "create a user with valid params" do
			valid_user_params = {
				first_name: Faker::Name.first_name, 
				last_name: Faker::Name.last_name,
				age: Faker::Number.number(2),
				gender: Faker::Gender.binary_type
			}

			expect {
				post :create, params: valid_user_params
			}.to change(User, :count).by(1)
		end
		
		it "create a user with invalid params" do
			invalid_user_params = {
				first_name: Faker::Name.first_name,
				last_name: Faker::Name.last_name,
				age: Faker::Number.negative,
				gender: Faker::Name.male_first_name
			}

			expect {
				post :create, params: invalid_user_params
			}.not_to change(User, :count)		
		end
	end

	describe "PUT #update" do
		let(:user) { FactoryBot.create(:user) }

		it "update a user with valid params" do
			valid_user_params = { age: Faker::Number.number(2) }

			put :update, params: ({ id: user }.merge valid_user_params)
			user.reload			
			expect(user.age).to eq valid_user_params[:age].to_i
		end
		
		it "update a user with invalid params" do
			invalid_user_params = { age: Faker::Number.negative }
			put :update, params: ({ id: user }.merge invalid_user_params)
			user.reload
			expect(user.age).not_to eq invalid_user_params
		end
	end

	describe "DELETE #destroy" do
		let(:users) { FactoryBot.create_list(:user, 10) }

		it "delete a user" do			
			user = users.first
			expect {
				delete :destroy, params: { id: user }
			}.to change(User, :count).by(-1)
		end
	end

	describe "PUT #address" do
		let(:user) { FactoryBot.create(:user) }

		it "update a user's address" do
			address = {
				"country" => Faker::Address.country,
				"address_1" => Faker::Address.street_address,
				"address_2" => Faker::Address.secondary_address
			}

			put :address, params: ({ id: user }.merge address)	
			user.reload
			expect(user.address).to eq address
		end
	end
end
