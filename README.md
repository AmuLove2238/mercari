## usersﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique:true|
|email|string|null: false, unique:true|
|password|integer|null: false, unique:true|

### Association
- has_many:items, through: :users_items
- has_many:users_items
- has_one:personal, dependent: :destroy
- has_one:phonenumber, dependent: :destroy
- has_one:address, dependent: :destroy
- has_one:credit_card, dependent: :destroy
- has_many: comments
- has_many: likes

## personalﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_namekana|string|null: false|
|first_namekana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|icon|text|-------|
|introduction|text|-------|
|user_id|reference|foreign_key: true|

### Association
- belong_to: user

## phonenumbersﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|
|user_id|integer|foreign_key:true|

### Association
- belong_to: user

## Addressﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|postalcode|integer|null: false|
|region_id|string|null: false|
|city|string|null: false|
|districtnum|string|null: false|
|user_id|reference|foreign_key:true|

### Association
- belong_to: user
- has_many: regions

## creditsﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|
|limit_year|integer|null: false|
|limit_month|integer|null: false|
|security|integer|null: false|
|user_id|reference|foreign_key|

### Association
- belong_to:user



## itemsﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|image_id|reference|foreign_key: true|
|name|string|null: false|
|detail|text|null: false|
|category_id|reference|null: false, foreing_key: true|
|condition_id|reference|null: false, foreign_key: true|
|postage_id|reference|null: false, foreign_key: true|
|region_id|reference|null: false, foreign_key: true|
|deliverdays|string|null: false|
|price|integer|null: false|
|handling|integer|-------|
|profit|string|-------|
|saler(user_id)|reference|foreign_key: true|
|buyer(user_id)|reference|foreign_key: true|

### Association
- has_many: images
- has_many: users, through: :users_items
- has_many: comments
- has_many: categories
- has_many: conditions
- has_many: postages
- has_many: regions
- has_many: likes
- has_many: comments

## imagesﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|image_url|text|null: false|
|item_id|reference|foreign_key: true|

### Association
- belong_to: item

## categoriesﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|item_id|reference|foreign_key: true|

### Association
- belong_to: item
- has_many: sizes

## sizesﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|category_id|reference|foreign_key: true|

### Association
- belong_to: category

## conditionsﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|item_id|reference|foreign_key: true|

### Association
- has_many: items

## postagesﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|item_id|reference|foreign_key: true|

### Association
- has_many: items

## regionsﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|item_id|reference|foreign_key: true|
|address_id|reference|foreign_key: true|

### Association
- belong_to: item
- belong_to: address

## commentsﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|item_id|reference|foreign_key: true|
|user_id|reference|foreign_key: true|

### Association
- belong_to: item
- belong_to: user


## users_itemsﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|item_id|reference|foreign_key: true|
|user_id|reference|foreign_key: true|

### Association
- belong_to: item
- belong_to: user

## likesﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|item_id|reference|foreign_key: true|
|user_id|reference|foreign_key: true|

### Association
- belong_to: item
- belong_to: user

## commentsﾃｰﾌﾞﾙ
|Column|Type|Options|
|------|----|-------|
|item_id|reference|foreign_key: true|
|user_id|reference|foreign_key: true|

### Association
- belong_to: item
- belong_to: user