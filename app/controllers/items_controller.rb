class ItemsController < ApplicationController

  before_action :move_to_index, except: :index
  
  def index
  end
  
  def show
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

  

  private
  def item_params
    params.require(:item).permit(
      :name, 
      :detail, 
      :deliverdays, 
      :price, 
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
    )
    # .merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to controller: :signup, action: :index unless user_signed_in?
  end

end
