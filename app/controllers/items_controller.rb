class ItemsController < ApplicationController

  before_action :move_to_index, except: :index
  
  before_action :set_item,only: [:show,:destroy]

  def index
    @items = Item.order("id DESC").limit(10)
  end

  MAX_DISPLAY_RELATED_PRODUCTS = 6

  def show
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
    @category = Category.all.order("id ASC").limit(13)
    
  end
  #カテゴリ機能で使うため
  # def search
  #   respond_to do |format|
  #     format.html
  #     format.json do
  #       @children = Category.find(params[:category_id]).children
  #        #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
  #     end
  #   end
  # end
  
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

  def edit
    
  end

  def update
    if @item.seller_id == current_user.id && @item.update(update_item_params)
      params[:images]['image'].each do |image|
        @item.images.update(image: image, item_id: @item.id)
      end
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.seller_id == current_user.id && @item.destroy
      redirect_to root_path
    else
      redirect_to items_path, alert: '削除に失敗しました。'
    end
    
  end


  private
  def set_item
    @item = Item.find(params[:id])
  end

  def update_item_params
    params.require(:item).permit(
      :name, 
      :detail, 
      :deliverdays, 
      :price,
      :prefecture_id,
      :profit,
      :condition,  
      :postage, 
      images_attributes: [:id,:_destroy,:image],
      regions_attributes: [:name]
    ).merge(
      seller_id: current_user.id)
  end

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
    ).merge(
      seller_id: current_user.id)
  end

  def move_to_index
    redirect_to controller: :signup, action: :index unless user_signed_in?
  end

end
