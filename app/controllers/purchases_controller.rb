class PurchasesController < ApplicationController
  before_action :redirect_to_sign_in
  before_action :set_item
  before_action :set_public_key

  def index
    @purchase_shipping_info= PurchaseShippingInfo.new
    redirect_to_top_page
  end
  
  def create
    @purchase_shipping_info = PurchaseShippingInfo.new(purchase_params)
    if @purchase_shipping_info.valid?
      pay_item
      @purchase_shipping_info.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def redirect_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def redirect_to_top_page
    if @item.purchase.present? || current_user == @item.user
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_public_key
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def purchase_params
    params.require(:purchase_shipping_info).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :address,
      :building,
      :phone_number
    ).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

end