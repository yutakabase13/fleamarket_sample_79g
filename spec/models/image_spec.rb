require 'rails_helper'

RSpec.describe Image, type: :model do
  describe '#item_create' do
    context 'can not save' do
      it 'is invalid without image' do
        image = build(:image, image: nil)
        image.valid?
        expect(image.errors[:image]).to include('は１枚以上添付してください')
      end
    end
  end
end
