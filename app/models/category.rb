class Category < ApplicationRecord
  has_many :items
  has_ancestry

  validates :category_name, presence: true
end
