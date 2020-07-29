class Brand < ApplicationRecord
  has_many :items
  
  validates :brand_name, presence: true
end
