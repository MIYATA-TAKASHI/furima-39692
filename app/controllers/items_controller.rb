class ItemsController < ApplicationController
  def index
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

  def items_params
    params.require(:item).permit(:name, :description, :category_id, :price, :status_id, :delivery_fee_burden_id, :prefecture_id,
                                 :day_until_shipping_id, :image).merge(user_id: current_user.id)
  end
end
