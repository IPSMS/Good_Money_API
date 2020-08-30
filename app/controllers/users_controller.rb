class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def profile
    # render json: current_user, include: [:followed, :followers]
    render json: current_user, include: [:stats, :action_infos]
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  # ***will calculate total
  def user_total
    
    render json: @user.total
  end

   # ***will calculate daily total
  def user_daily_total
    
    render json: @user.daily_total
  end


  private
    def set_user
      @user = User.find(params[:id])
    end
  
      # Only allow a trusted parameter "white list" through.
      def user_params
        params.permit(:username, :first_name, :last_name, :email, :phone, :location, :password, :password_confirmation)
      end
end
