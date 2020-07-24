require 'rails_helper'

RSpec.describe Account, type: :model do
  describe '#create_account' do
    context 'can save' do
      it 'is valid with required input' do
        expect(build(:account)).to be_valid
      end
    end
    context 'can not save' do
      context 'with blank' do
        it 'is invalid without first_name' do
          account = build(:account, first_name: nil)
          account.valid?
          expect(account.errors[:first_name]).to include('を入力してください')
        end
        it 'is invalid without family_name' do
          account = build(:account, family_name: nil)
          account.valid?
          expect(account.errors[:family_name]).to include('を入力してください')
        end
      end
    end
  end
end