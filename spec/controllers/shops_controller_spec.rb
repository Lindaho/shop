require 'rails_helper'

RSpec.describe ShopsController, type: :controller do
	describe "GET #show" do
		it "should assigns shop to @shop" do
			shop = FactoryBot.create(:shop, user: user)
			get :show, id: user
			expect(assigns(:shop).to_a).to eq shop
			expect(response).to have_http_status(:success)
		end
	end

	describe "POST #create" do
		let(:user) { FactoryBot.create(:user) }

		it "create a shop" do
			shop = {
				name: Faker::Name.name_with_middle,
				tel: Faker::PhoneNumber.cell_phone
			}

			post :create, id: user, shop: shop	

			user.reload
			expect(user.shop).to eq shop		
		end
	end

	describe "PUT #update" do
		let(:shop) { FactoryBot.create(:shop, user: user) }

		it "update a shop" do
			shop = {
				name: Faker::Name.name_with_middle,
				tel: Faker::PhoneNumber.cell_phone
			}

			put :update, id: user, shop: shop	

			user.reload
			expect(user.shop).to eq shop
		end
	end

	describe "DELETE #destroy" do
		let(:shop) { FactoryBot.create(:shop, user: user) }

		it "delete a shop" do
			delete :destroy, id: user
			
			user.reload
			expect(user.address).to be_nil
		end
	end
end
