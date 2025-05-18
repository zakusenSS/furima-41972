class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # 商品テーブルのアソシエーション
  belongs_to :user
  has_one    :purchases

  # ActiveSStorageのアソシエーション
  has_one_attached :image

  # ActiveHashのアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_time
  
  # バリデーション
  with_options presence: true do
    validates :user_id
    validates :


end
