class Address < ApplicationRecord
  with_options presence: true do
    validates :post_code
    validates :address
    validates :city
    validates :prefecture 
    validates :zipcode
 
    with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
      validates :first_name
      validates :last_name
    end
  end

  belongs_to :user
end
