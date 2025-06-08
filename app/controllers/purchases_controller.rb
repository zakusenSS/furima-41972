class PurchasesController < ApplicationController
  before_action :set_item, only: [:new, :create]

  def index
    @purchase_form = PurchaseForm.new
  end

  def new
    @purchase_from = PurchaseForm.new
  end

  def create
    @purchase_form = Purchase.new(purchase_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  
  private

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :address, :building_name,
                                          :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
