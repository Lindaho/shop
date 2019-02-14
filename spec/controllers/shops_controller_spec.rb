require 'rails_helper'

RSpec.describe ShopsController, type: :controller do
	describe "GET #show" do
		let(:user) { FactoryBot.create(:user) }

		it "should assigns shop to @shop" do
			shop = FactoryBot.create(:shop, user: user)
			get :show, params: { user_id: user }
			expect(assigns(:shop)).to eq shop
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

			post :create, params: ({ user_id: user }.merge shop)
			user.reload
			expect(user.shop.name).to eq shop[:name]
			expect(user.shop.tel).to eq shop[:tel]
		end
	end

	describe "PUT #update" do
		let(:user) { FactoryBot.create(:user) }
		let(:shop) { FactoryBot.create(:shop, user: user) }

		it "update a shop" do
			new_shop = {
				name: Faker::Name.name_with_middle,
				tel: Faker::PhoneNumber.cell_phone
			}

			put :update, params: ({ user_id: shop.user }.merge new_shop)

			shop.reload
			expect(shop.name).to eq new_shop[:name]
			expect(shop.tel).to eq new_shop[:tel]
		end
	end

	describe "DELETE #destroy" do
		let(:user) { FactoryBot.create(:user) }
		let(:shop) { FactoryBot.create(:shop, user: user) }

		it "delete a shop" do
			delete :destroy, params: { user_id: user }

			user.reload
			expect(user.shop).to be_nil
		end
	end
end
