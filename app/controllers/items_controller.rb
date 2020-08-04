class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :sell, :confirmation]
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
      render :new
    end
  end

  def confirmation
  end

  def show
    @user_name = User.find(@item.id).nickname
    @brand = Brand.find(@item.id).
    @category_name = Category.find(@item.category_id).category_name
    
  end

  def edit
      @item.edit
  end
  def item_params
    params.require(:item).permit(:name, :price, :description, :item_status, :shipping_fee, :owner_area, :shipping_date, :seller_id, images_attributes: [:image, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
