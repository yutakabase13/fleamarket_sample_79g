class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :fee_id
    validates :status_id
    validates :owner_area
    validates :shipping_id
  end

  validates :price, format: {with: /\A[a-zA-Z]+\z/, message: "は半角数字のみ入力してください"}, allow_blank: true
  validates :price, format: {with: /\A[０-９]+\z/, message: "は半角数字のみ入力してください"}, allow_blank: true
  validates :price, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "は半角数字のみ入力してください"}, allow_blank: true

  #image紐付け先のバリデーション
  validates_associated :images
  validates :images, presence: { message: 'は１枚以上添付してください'} 
  #ここまでimageのバリデーション

  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
end
