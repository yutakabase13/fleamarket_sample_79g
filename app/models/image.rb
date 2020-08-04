class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item, optional: true

  validates :image, presence: {message: 'は１枚以上添付してください'}
end
