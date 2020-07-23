FactoryBot.define do
  factory :account do
    first_name {"名前"}
    last_name {"苗字"}
    hurigana_first {"なまえ"}
    hurigana_family {"みょうじ"}
    birthday {Faker::Date.birthday}
  end
end