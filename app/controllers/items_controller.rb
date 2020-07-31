class ItemsController < ApplicationController
  before_action :set_params, except: [:index, :new, :create, :show, :sell]
  def index
  end

  def sell
  end
  
  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path      
    else
      @item.images.new
      render :new
    end
  end

  def confirmation
  end

  def show
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :status_id, :fee_id, :owner_area, :shipping_id, :seller_id, images_attributes: [:image, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
