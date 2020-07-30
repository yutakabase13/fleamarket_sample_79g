require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid without buyer_id' do
        expect(build(:item, buyer_id: nil)).to be_valid
      end
    end
    context 'can not save' do
      context 'with blank' do
        it 'is invalid without name' do
          item = build(:item, name: nil)
          item.valid?
          expect(item.errors[:name]).to include('を入力してください')
        end
        it 'is invalid without description' do
          item = build(:item, description: nil)
          item.valid?
          expect(item.errors[:description]).to include('を入力してください')
        end
        it 'is invalid without price' do
          item = build(:item, price: nil)
          item.valid?
          expect(item.errors[:price]).to include('を入力してください')
        end
        it 'is invalid without fee_id' do
          item = build(:item, fee_id: nil)
          item.valid?
          expect(item.errors[:fee_id]).to include('を入力してください')
        end
        it 'is invalid without status_id' do
          item = build(:item, status_id: nil)
          item.valid?
          expect(item.errors[:status_id]).to include('を入力してください')
        end
        it 'is invalid without owner_area' do
          item = build(:item, owner_area: nil)
          item.valid?
          expect(item.errors[:owner_area]).to include('を入力してください')
        end
        it 'is invalid without shipping_id' do
          item = build(:item, shipping_id: nil)
          item.valid?
          expect(item.errors[:shipping_id]).to include('を入力してください')
        end
      end
      context 'with invalid form data' do
        it 'is invalid with japanese letter in price column' do
          item = build(:item, price: "ああ")
          item.valid?
          expect(item.errors[:price]).to include('は半角数字のみ入力してください')
        end
        it 'is invalid with one space digit letter in price column' do
          item = build(:item, price: "１２３")
          item.valid?
          expect(item.errors[:price]).to include('は半角数字のみ入力してください')
        end
        it 'is invalid with alphabet' do
          item = build(:item, price: "abc")
          item.valid?
          expect(item.errors[:price]).to include('は半角数字のみ入力してください')
        end
      end
    end
  end
end
