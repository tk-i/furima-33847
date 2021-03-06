class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :user_difference, only: [:edit, :update, :destroy]
  before_action :purchased_item, only: [:edit, :destroy, :update]
  
  def index
    @items = Item.all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      return redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :text, :category_id, :price, :status_id, :burden_id, :area_id, :shipment_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_difference
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def purchased_item
    if @item.log.present?
      redirect_to root_path
    end
  end
end