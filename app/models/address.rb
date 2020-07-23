class Address < ApplicationRecord
  with_options presence: true do
    validates :address
    validates :city
    validates :prefecture 
    validates :zipcode
 
    with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
      validates :shipping_first_name
      validates :shipping_family_name
    end
  end

  belongs_to :user, optional: true
end
