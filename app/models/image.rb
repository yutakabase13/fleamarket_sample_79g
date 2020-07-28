class Image < ApplicationRecord
  validates :image, presence: true
  validate :more_than_zero
  mount_uploader :src, ImageUploader
  belongs_to :item

  def validate(image)
    unless image
      errors.add(:image, "写真は１枚以上を貼り付けしてください")
    end
  end
end
