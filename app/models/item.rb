class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # 商品テーブルのアソシエーション
  belongs_to :user
  # has_one    :purchases

  # ActiveStorageのアソシエーション
  has_one_attached :image

  # ActiveHashのアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_time

  # バリデーション(空の投稿を保存できないようにする)
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :delivery_time_id
    # 価格は、￥300～￥9,999,999の間のみ保存可能。また、半角英数値のみ保存可能。
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  end

   #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 0 , message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :delivery_time_id
  end
end
