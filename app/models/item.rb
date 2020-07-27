class Item < ApplicationRecord
  has_many :images
  accept_nested_attributes_for :images, allow_destroy: true
end
