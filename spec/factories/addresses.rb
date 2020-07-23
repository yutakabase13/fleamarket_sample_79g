FactoryBot.define do
  factory :address do
    shipping_first_name {"名前"}
    shipping_family_name {"苗字"}
    shipping_hurigana_first {"なまえ"}
    shipping_hurigana_family {"みょうじ"}
    zipcode {"123-4567"}
    prefecture {"東京都"}
    city {"大田区"}
    address {"ホゲ三丁目"}
    others {"フガフガメゾン-201号"}
    phone_number {"123-4567-7891"}
  end
end