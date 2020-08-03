class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :shipping_fee
    validates :item_status
    validates :owner_area
    validates :shipping_date
  end
  #image紐付け先のバリデーション
  validates_associated :images
  validates :images, presence: { message: 'は１枚以上添付してください'}
  #ここまでimageのバリデーション

  #userテーブルの「id」とitemsテーブルの「buyer_id」「saler_id」の紐付け
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  #選択肢作成
  enum item_status: {
    "新品": "新品",
    "未使用に近い": "未使用に近い",
    "目立った傷等はない": "目立った傷等はない",
    "軽い傷がある": "軽い傷がある",
    "汚れが多い": "汚れが多い",
    "かなり汚れている": "かなり汚れている",
  }
  enum shipping: {
    "1~2日": "1~2日",
    "2~3日": "2~3日",
    "3~4日": "3~4日",
    "4~5日": "4~5日",
    "一週間以上": "一週間以上",
  }
  enum shipping_fee: {
    "送料込み(出品者負担)": "送料込み(出品者負担)",
    "着払い(購入者負担)": "着払い(購入者負担)"
  }
end
