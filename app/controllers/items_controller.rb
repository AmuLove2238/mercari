class ItemsController < ApplicationController
  def index
    @items = Item.order("id DESC").limit(10)
  end

  MAX_DISPLAY_RELATED_PRODUCTS = 6

  def show
    @item = Item.find(params[:id])
    @user = @item.seller
    @related_items = Item.distinct.where.not(id: @item.id).sample(MAX_DISPLAY_RELATED_PRODUCTS)
    
  end

  def new
    @item = Item.new
    # ↓後ほど機能追加
    # @item.build_shipment
    # @item.build_brand
    @item.images.build
    @item.regions.build
  end
  
  def create
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

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end



  private
  def item_params
    params.require(:item).permit(
      :name, 
      :detail, 
      :deliverdays, 
      :price,
      :prefecture_id,
      # ↓後ほど機能追加のためコメントアウト
      # :handing,
      :profit,
      :condition, 
      # :first_category_id, 
      # :second_category_id, 
      # :third_category_id, 
      # :size, 
      :postage, 
      images_attributes: [:image],
      regions_attributes: [:name]
    ).merge(seller_id: current_user.id)
  end

end
