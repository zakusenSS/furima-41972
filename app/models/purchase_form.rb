class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number , format: { with: /\A[0-9]{10,11}\z/, message: 'must be 10 or 11 digits longs' }
  end

  def save
    purchase = Purchase.create(user_id:, item_id:)

    ShippingAddress.create(
      postal_code:,
      prefecture_id:,
      city:,
      address:,
      building_name:,
      phone_number:,
      purchase_id: purchase.id
    )
  end
end

