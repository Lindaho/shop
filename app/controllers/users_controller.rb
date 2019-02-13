class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :address]
  skip_before_action :verify_authenticity_token

  # GET /users
  # GET /users.json
  def index
    @users = User.all   
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # POST /users
  # POST /users.json
  def create    
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def address
    respond_to do |format|
      if @user.update(address: user_address)
        format.html { redirect_to @user, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(_id: params[:id])

      render status: 404, json: { message: 'user not found.'} unless @user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
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
