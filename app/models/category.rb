class Category < ApplicationRecord
  belongs_to :item
  has_many :sizes
  # has_ancestry 

end
# class Category < ActiveHash::Base
#   self.data = [
#       {id: 1, name: 'メンズ'}, {id: 2, name: 'レディース'}, {id: 3, name: 'ベビーキッズ'},
#       {id: 4, name: 'インテリア・住まい・小物'}, {id: 5, name: '本・音楽・ゲーム'}, {id: 6, name: 'おもちゃ・ホビー・キッズ'},
#       {id: 7, name: 'コスメ・香水・美容'}, {id: 8, name: '家電・スマホ・カメラ'}, {id: 9, name: 'スポーツ・レジャー'},
#       {id: 10, name: 'ハンドメイド'}, {id: 11, name: 'チケット'}, {id: 12, name: '自転車・オートバイ'},
#       {id: 13, name: 'その他'}
#   ]
# end
