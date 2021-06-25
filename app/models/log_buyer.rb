class LogBuyer
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :city, :address, :address2, :phone, :user_id, :item_id, :token
  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone, numericality: { only_integer: true }, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    log = Log.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal: postal, area_id: area_id, city: city, address: address, address2: address2, phone: phone, log_id: log.id)
  end
end
