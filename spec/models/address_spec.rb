require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid without others and phone_numbner' do
        expect(build(:address, others: nil, phone_number: nil)).to be_valid
      end
    end
    context 'can not save' do
      context 'with blank' do
        it 'is invalid without shipping_first_name' do
          address = build(:address, shipping_first_name: nil)
          address.valid?
          expect(address.errors[:shipping_first_name]).to include("を入力してください")
        end

        it 'is invalid without shipping_family_name' do
          address = build(:address, shipping_family_name: nil)
          address.valid?
          expect(address.errors[:shipping_family_name]).to include("を入力してください")
        end

        it 'is invalid without shipping_hurigana_first' do
          address = build(:address, shipping_hurigana_first: nil)
          address.valid?
          expect(address.errors[:shipping_hurigana_first]).to include("を入力してください")
        end

        it 'is invalid without shipping_hurigana_family' do
          address = build(:address, shipping_hurigana_family: nil)
          address.valid?
          expect(address.errors[:shipping_hurigana_family]).to include("を入力してください")
        end

        it 'is invalid without zipcode' do
          address = build(:address, zipcode: nil)
          address.valid?
          expect(address.errors[:zipcode]).to include("を入力してください")
        end

        it 'is invalid without prefecture' do
          address = build(:address, prefecture: nil)
          address.valid?
          expect(address.errors[:prefecture]).to include("を入力してください")
        end

        it 'is invalid without city' do
          address = build(:address, city: nil)
          address.valid?
          expect(address.errors[:city]).to include("を入力してください")
        end

        it 'is invalid without address' do
          address = build(:address, address: nil)
          address.valid?
          expect(address.errors[:address]).to include("を入力してください")
        end
      end
      context 'with invalid input type' do
        it 'is invalid with kanji hurigana_first_name' do
          address = build(:address, shipping_hurigana_first: '漢字')
          address.valid?
          expect(address.errors[:shipping_hurigana_first]).to include("は全角ひらがなで入力してください")
        end

        it 'is invalid with half kanji hurigana_family_name' do
          address = build(:address, shipping_hurigana_family: '漢字')
          address.valid?
          expect(address.errors[:shipping_hurigana_family]).to include("は全角ひらがなで入力してください")
        end

        it 'is invalid with half space letter at shipping_first' do
          address = build(:address, shipping_first_name: "aa")
          address.valid?
          expect(address.errors[:shipping_first_name]).to include("は全角で入力してください")
        end

        it 'is invalid with half space letter at shipping_family' do
          address = build(:address, shipping_family_name: "aa")
          address.valid?
          expect(address.errors[:shipping_family_name]).to include("は全角で入力してください")
        end

        it 'is invalid with "-" at zipcode' do
          address = build(:address, zipcode: "123-4567")
          address.valid?
          expect(address.errors[:zipcode]).to include("は-(ハイフン)無しで入力してください")
        end

        it 'is invalid with "-" at phone_number' do
          address = build(:address, phone_number: "123-4566-7891")
          address.valid?
          expect(address.errors[:phone_number]).to include("は-(ハイフン)無しで入力してください")
        end
      end
    end
  end
end