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
        it 'is invalid without shipping_fee' do
          item = build(:item, shipping_fee: nil)
          item.valid?
          expect(item.errors[:shipping_fee]).to include('を入力してください')
        end
        it 'is invalid without item_status' do
          item = build(:item, item_status: nil)
          item.valid?
          expect(item.errors[:item_status]).to include('を入力してください')
        end
        it 'is invalid without owner_area' do
          item = build(:item, owner_area: nil)
          item.valid?
          expect(item.errors[:owner_area]).to include('を入力してください')
        end
        it 'is invalid without shipping_date' do
          item = build(:item, shipping_date: nil)
          item.valid?
          expect(item.errors[:shipping_date]).to include('を入力してください')
        end
      end
    end
  end
end
