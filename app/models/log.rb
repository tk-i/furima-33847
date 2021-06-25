class Log < ApplicationRecord
  belongs_to :user
  has_one :buyer
  belongs_to :item
end
