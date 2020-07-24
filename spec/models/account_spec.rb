require 'rails_helper'

RSpec.describe Account, type: :model do
  describe '#create_account' do
    context 'can save' do
      it 'is valid with required input' do
        expect(build(:account)).to be_valid
      end
    end
  end
end