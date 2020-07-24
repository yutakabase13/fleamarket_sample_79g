require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    context "can save" do
      it "is valid with required value" do
        expect(build(:user)).to be_valid
      end
    end
    context "can not save" do
      it 'is invalid without nickname' do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      it 'is invalid without email' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it 'is invalid without password' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it 'is invalid without password_confirmation' do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it 'is invalid with password more than 6 words' do
        user = build(:user, password: 'aaaaaa')
        user.valid?
        expect(user.errors[:password]).to include("は7文字以上で入力してください")
      end
    end
  end
end