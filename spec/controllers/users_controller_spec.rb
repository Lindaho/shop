require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe "GET #index" do
		it "should assigns all users to @users" do
			user = FactoryBot.create(:user)
			get :index		
			expect(assigns(:users).to_a).to eq [user]
		end
	end

	describe "GET #show" do
		it "should assigns post to @post" do
		end
	end

	describe "GET #create" do
		
	end

end
