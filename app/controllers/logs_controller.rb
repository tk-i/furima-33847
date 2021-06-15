class LogsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @log_buyer = LogBuyer.new
  end

  def create
    @log_buyer = LogBuyer.new(log_buyer_params)
    if @log_buyer.valid?
      @log_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def log_buyer_params
    params.require(:log_buyer).permit(:postal, :area_id, :city, :address, :address2, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
