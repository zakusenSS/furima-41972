class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]


  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if @item.user_id != current_user.id || @item.purchase!=nil
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
