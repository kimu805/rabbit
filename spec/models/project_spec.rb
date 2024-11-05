require 'rails_helper'

RSpec.describe Project, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @project = FactoryBot.build(:project, user: @user)
  end
  describe "新規作成" do
    context "上手くいくとき" do
      it "全ての情報が適切に入力されていれば、作成できる" do
        expect(@project).to be_valid
      end
      it "descriptionが空でも作成できる" do
        @project.description = ""
        expect(@project).to be_valid
      end
    end
    context "上手くいかないとき" do
      it "titleが空では作成できない" do
        @project.title = ""
        @project.valid?
        expect(@project.errors.full_messages).to include("タイトルを入力してください")
      end
      it "titleが51文字以上では作成できない" do
        @project.title = Faker::Lorem.characters(number: 51)
        @project.valid?
        expect(@project.errors.full_messages).to include("タイトルは50文字以内で入力してください")
      end
      it "descriptionが501文字以上では作成できない" do
        @project.description = Faker::Lorem.characters(number: 501)
        @project.valid?
        expect(@project.errors.full_messages).to include("概要は500文字以内で入力してください")
      end
      it "userが紐づいていなければ作成できない" do
        @project.user = nil
        @project.valid?
        expect(@project.errors.full_messages).to include("Userを入力してください")
      end
    end 
  end
end
