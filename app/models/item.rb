class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid" }
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :shipment
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :shipment_id
    validates :status_id
    validates :burden_id
    validates :area_id
  end
end