class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path, notice: '商品が出品されました。'
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user
    return unless current_user.id != @item.user_id

    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :category_id,
      :price,
      :status_id,
      :delivery_fee_burden_id,
      :prefecture_id,
      :days_until_shipping_id, :image
    ).merge(user_id: current_user.id)
  end
end
