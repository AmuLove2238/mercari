class ItemsController < ApplicationController
  def index
  end
  
  def show
  end

  def new
    @item = Item.new
    # @item.build_shipment
    # @item.build_region
    @postage=Postage.all.order("id ASC")
    @days= Item.select("deliverdays")
    # @days = Item.find(params[:deliverdays_id])
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.permit(:name, :detail, :deliverdays, :price, :handing, :profit)
  end
end


