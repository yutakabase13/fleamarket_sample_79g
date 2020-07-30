FactoryBot.define do
  factory :item do
    name {"商品"}
    description {Faker::Lorem.sentence}
    price {Faker::Number.number(digits: 7)}
    item_status {"新品"}
    owner_area {"東京都"}
    shipping_date {"1~2日"}
    shipping_fee {"送料込み(出品者負担)"}
    seller_id {"1"}
    buyer_id {"2"}
    after(:build) do |item|
      parent_category = create(:category)
      child_category = parent_category.children.create(category_name: "子カテゴリ")
      grand_child_category = child_category.children.create(category_name: "子カテゴリ")
      item.category_id = grand_child_category.id
      item.brand_id = create(:brand)
      item.images << build(:image)
    end
  end
end
