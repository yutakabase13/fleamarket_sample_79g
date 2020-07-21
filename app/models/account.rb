class Account < ApplicationRecord
  with_options presence: true do
    validates :birthday
    with_options format: {with: /\A[ぁ-んー－]+\z/} do
      validates :hurigana_first
      validates :hurigana_family
    end
    
    with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
      validates :first_name
      validates :last_name
    end
  end
  
  belogns_to :user
end
