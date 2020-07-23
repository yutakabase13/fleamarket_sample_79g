require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    context "can save" do
      it "is valid with required value" do
        expect(build(:user)).to be_valid
      end
    end
    context "can not save" do
      
    end
  end
end