class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :sell]

  def index
  end

  def sell
  end

  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.category_name
    end
  end

  def get_category_children
    @category_children = Category.find_by(category_name: "#{params[:parent_name]}").children
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
      render :new
    end
  end

  def confirmation
  end

  def show
  end

  def destroy
    @item.destroy
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :status_id, :fee_id, :owner_area, :shipping_id, :seller_id, images_attributes: [:image, :_destroy, :id])
  end

  def set_item
    # カテゴリーボックスのさいにエラーが出てしまうので一時的にコメントアウト
    # @item = Item.find(params[:id])
  end


end
