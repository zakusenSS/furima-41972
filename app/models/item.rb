class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # 商品テーブルのアソシエーション
  belongs_to :user
  has_one    :purchases

  # ActiveSStorageのアソシエーション
  has_one_attached :image

  # ActiveHashのアソシエーション
  belongs_to :category
  belongs_to :status_id
  belongs_to :shipping_fee_id
  belongs_to :prefecture_id
  belongs_to :delivery_time_id




end
