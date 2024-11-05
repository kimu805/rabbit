require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    @tag = FactoryBot.build(:tag)
  end
  describe "新規作成" do
    context "上手くいく場合" do
      it "tag_nameが適切に入力されている場合、作成できる" do
        expect(@tag).to be_valid
      end
    end
    context "上手くいかない場合" do
      it "tag_nameが空では登録できない" do
        @tag.tag_name = ""
        @tag.valid?
        expect(@tag.errors.full_messages).to include("タグを入力してください")
      end
      it "重複したtag_nameは登録できない" do
        @tag.save
        another_tag = FactoryBot.build(:tag, tag_name: @tag.tag_name)
        another_tag.valid?
        expect(another_tag.errors.full_messages).to include("タグはすでに存在します")
      end
      it "tag_nameは20文字以上では登録できない" do
        @tag.tag_name = Faker::Lorem.characters(number: 21)
        @tag.valid?
        expect(@tag.errors.full_messages).to include("タグは20文字以内で入力してください")
      end
    end
  end
end
