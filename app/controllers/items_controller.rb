class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy]
  def index
  end

  def sell
  end

  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = Category.where(ancestry: nil)
  end

  def get_category_children
    @category_children = Category.find_by(id: "#{params[:parent_id]}").children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path(@item)
    else
      @item.images.new
      @category_parent_array = Category.where(ancestry: nil)
      render :new
    end
  end

  def confirmation
  end

  def show
    @user_name = User.find(@item.seller_id).nickname
    @owner_place = User.find(@item.seller_id).address.prefecture.name
    @brand = Brand.find(@item.id).brand_name
    @category_name = Category.find(@item.category_id).category_name
    @shipping = Shipping.find(@item.seller_id).name
    @status = Status.find(@item.status_id).name
    @fee = Fee.find(@item.fee_id).name
  end


  def edit
  end
  
  def destroy
    @item.destroy
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :status_id, :fee_id, :owner_area, :shipping_id, :seller_id, :category_id, :brand_id, images_attributes: [:image, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
