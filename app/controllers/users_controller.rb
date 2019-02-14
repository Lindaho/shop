class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :address]
  skip_before_action :verify_authenticity_token

  # GET /users
  def index
    @users = User.all   
  end

  # GET /users/1
  def show
  end

  # POST /users
  def create    
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity 
    end

  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
    
  end

  # DELETE /users/1
  def destroy
    @user.destroy

    render status: :destroyed, json: { message: 'User was successfully destroyed'}
  end

  # PUT /users/1/address
  def address
    if @user.update(address: user_address)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
    
  end

  private
    def set_user
      @user = User.find_by(_id: params[:id])

      render status: 404, json: { message: 'user not found.'} unless @user
    end

    def user_params
      params.permit(:first_name, :last_name, :gender, :age)
    end

############################################################################
    def user_address
      address = params.permit(:country, :address_1, :address_2).to_h

      @user.address.merge(address) unless @user.address.nil?

      address
# TODO
      # address.transform_keys{ |key| "address.#{key}" }
    end
############################################################################    
end
