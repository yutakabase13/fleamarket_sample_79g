class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :item_status
    validates :owner_area
    validates :shipping_date
  end

  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  enum status: {
    "新品": 0,
    "未使用に近い": 1,
    "目立った傷等はない": 2,
    "軽い傷がある": 3,
    "汚れが多い": 4,
    "かなり汚れている": 5,
  }
  enum shipping: {
    "1~2日": 0,
    "2~3日": 1,
    "3~4日": 2,
    "4~5日": 3,
    "一週間以上": 4,
  }
end
