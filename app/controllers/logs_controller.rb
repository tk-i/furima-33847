class LogsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index]
  before_action :same_user, only: [:index]

  def index
    @log_buyer = LogBuyer.new
  end

  def create
    @log_buyer = LogBuyer.new(log_buyer_params)
    if @log_buyer.valid?
      pay_item
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
    params.require(:log_buyer).permit(:postal, :area_id, :city, :address, :address2, :phone).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: log_buyer_params[:token],
      currency:'jpy'
    )
  end
  
  def sold_out_item
    if @item.log.present?
      redirect_to root_path
    end
  end
  
  def same_user
    if current_user == @item.user
      redirect_to root_path
    end
  end
end
