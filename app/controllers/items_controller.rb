class ItemsController < ApplicationController
  def index
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :category_id, :price, :status_id, :delivery_fee_burden_id, :prefecture_id, :day_until_shipping_id, :image).merge(user_id: current_user.id)
  end
end
