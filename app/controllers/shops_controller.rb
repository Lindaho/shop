class ShopsController < ApplicationController
	before_action :set_user
	before_action :set_shop, except: [:create]
	skip_before_action :verify_authenticity_token

	def show

	end

	def create
		@shop = @user.build_shop(store_params)

  		if @shop.save
			render :show, status: :created, location: user_shop_url
		else
			render json: @shop.errors, status: :unprocessable_entity
		end
	end

	def update			
		if @shop.update(store_params)
			render :show, status: :updated, location: user_shop_url
		else
			render json: @shop.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@shop.destroy 
		
		render status: :destroyed, json: { message: 'Shop was successfully destroyed'}
	end

	private
	def store_params
		params.permit(:name, :tel)
	end

	def set_user
		@user = User.find_by(_id: params[:user_id])

		render status: 404, json: { message: 'user not found.'} unless @user
	end

	def set_shop
		@shop = @user.shop

		render status: 404, json: { message: 'user do not have shop.'} unless @shop
	end
end
