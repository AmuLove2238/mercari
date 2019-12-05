class ItemsController < ApplicationController
  def index
  end
  
  def show
  end

  def new
    @item = Item.new
    # @item.build_shipment
    # @item.build_brand
    @item.images.build
    @postage=Postage.all.order("id ASC")
    @days= Item.select("deliverdays")

    @condition = Condition.all.order("id ASC")
  end

  def create
    # Item.create(item_params)
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
          params[:images]['image'].each do |image|
            @item.images.create(image: image, item_id: @item.id)
          end
        format.html{redirect_to root_path}
      else
        @item.images.build
        format.html{render action: 'new'}
      end
    end
  end
  private
  def item_params
    params.require(:item).permit(
      :name, 
      :description, 
      # :first_category_id, 
      # :second_category_id, 
      # :third_category_id, 
      :size, 
      :product_status, 
      :delivery_fee, 
      :prefecture_id, 
      :lead_time, 
      :price, 
      :transaction_status, 
      :handing,
      :profit,
      images_attributes: [:image]
    ).merge(user_id: current_user.id)
  end

end
