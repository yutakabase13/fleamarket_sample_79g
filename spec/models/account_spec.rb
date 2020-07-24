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
        it 'is invalid without hurigana_first' do
          account = build(:account, hurigana_first: nil)
          account.valid?
          expect(account.errors[:hurigana_first]).to include('を入力してください')
        end
        it 'is invalid without hurigana_family' do
          account = build(:account, hurigana_family: nil)
          account.valid?
          expect(account.errors[:hurigana_family]).to include('を入力してください')
        end
        it 'is invalid without birthday' do
          account = build(:account, birthday: nil)
          account.valid?
          expect(account.errors[:birthday]).to include('を入力してください')
        end
      end
      context 'with invalid input letter type' do
        it 'is invalid with half letter space at first_name' do
          account = build(:account, first_name: 'aa')
          account.valid?
          expect(account.errors[:first_name]).to include('は全角で入力してください')
        end
        it 'is invalid with half letter space at family_name' do
          account = build(:account, family_name: 'aa')
          account.valid?
          expect(account.errors[:family_name]).to include('は全角で入力してください')
        end
        it 'is invalid without hiragana at hurigana_first' do
          account = build(:account, hurigana_first: '漢字')
          account.valid?
          expect(account.errors[:hurigana_first]).to include('は全角ひらがなで入力してください')
        end
        it 'is invalid without hiragana at hurigana_family' do
          account = build(:account, hurigana_family: '漢字')
          account.valid?
          expect(account.errors[:hurigana_family]).to include('は全角ひらがなで入力してください')
        end
      end
    end
  end
end