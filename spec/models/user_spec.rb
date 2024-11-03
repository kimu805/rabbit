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
      it "profileが空でも登録できる" do 
        @user.profile = ""
        expect(@user).to be_valid
      end
    end
    context "上手くいかないとき" do
      it "nicknameが空では登録できない" do

      end
      it "nicknameは21文字以上では登録できない" do

      end
      it "profileは501文字以上では登録できない" do

      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it "重複したemailは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it "@を含まないemailは登録できない" do
        @user.email = "aaaaaa.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordは5文字以下では登録できない" do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordは129文字以上では登録できない" do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは128文字以内で入力してください")
      end
      it "passwordとpassword_confirmationは同じでないと登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "654321"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
