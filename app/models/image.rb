class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item

  validates :image, presence: {message: 'は１枚以上添付してください'}
end
