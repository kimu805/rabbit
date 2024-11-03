require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "上手くいくとき" do
      it "全ての情報が適切に入力されていれば、登録できる" do 
        expect(@user).to be_valid
      end
      it "profileが空でも登録できる。" do 
        @user.profile = ""
        expect(@user).to be_valid
      end
    end
    context "上手くいかないとき" do

    end
  end
end
