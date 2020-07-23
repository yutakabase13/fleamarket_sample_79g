class Account < ApplicationRecord
  with_options presence: true do
    validates :birthday
    validates :hurigana_first
    validates :hurigana_family
    validates :first_name
    validates :family_name
  end
  with_options format: {with: /\A[ぁ-んー－]+\z/, message: "は全角ひらがなで入力してください"} do
    validates :hurigana_first, allow_blank: true
    validates :hurigana_family, allow_blank: true
  end
  
  with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "は全角で入力してください"} do
    validates :first_name, allow_blank: true
    validates :family_name, allow_blank: true
  end
  
  belongs_to :user, optional: true
end
