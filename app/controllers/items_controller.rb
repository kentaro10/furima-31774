class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy ]
  before_action :move_to_index, only: :edit
  before_action :move_to_index_2, only: :edit
  def index
    @items = Item.includes(:user).order("created_at DESC")
    
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
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id 
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
    
  end


  private

  def item_params
    params.require(:item).permit(:name, :explanation, :selling_price, :category_id, :status_id, :burden_of_shipping_charge_id, :shipping_area_id, :days_to_ship_id, images: [] ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    # before_actionのset_itemをmove_to_indexの前に置いたため、→の記述は記入する必要がなくなる。@item = Item.find(params[:id])
   unless user_signed_in?  && current_user.id == @item.user_id 
    redirect_to action: :index
   end
  end

  def move_to_index_2
    unless  @item.order.blank?
      redirect_to action: :index
    end
  end
end
