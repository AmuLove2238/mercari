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
end