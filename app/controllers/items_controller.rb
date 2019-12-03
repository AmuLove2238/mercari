class ItemsController < ApplicationController
  def index
  end
  
  def show
  end

  def new
    @item = Item.new
    # @item.build_shipment
    # @item.build_brand

    @condition = Condition.all.order("id ASC")
  end
end