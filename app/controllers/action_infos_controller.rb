class ActionInfosController < ApplicationController
  before_action :set_action_info, only: [:show, :update, :destroy]

  # GET /action_infos
  def index
    @action_infos = ActionInfo.all

    render json: @action_infos
  end

  # GET /action_infos/1
  def show
    render json: @action_info
  end

  # POST /action_infos
  def create
    @action_info = ActionInfo.new(action_info_params)
    
    if @action_info.save
      render json: @action_info, status: :created, location: @action_info
    else
      render json: @action_info.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /action_infos/1
  def update
    if @action_info.update(action_info_params)
      render json: @action_info
    else
      render json: @action_info.errors, status: :unprocessable_entity
    end
  end

  # DELETE /action_infos/1
  def destroy
    @action_info.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_info
      @action_info = ActionInfo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def action_info_params
      params.permit(:name, :amount, :user_id)
    end
end
