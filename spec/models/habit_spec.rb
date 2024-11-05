require 'rails_helper'

RSpec.describe Habit, type: :model do
  before do
    @project = FactoryBot.create(:project)
    @habit = FactoryBot.build(:habit, project_id: @project.id)
  end
  describe "新規作成" do
    context "上手くいく場合" do
      it "全ての情報が正しく入力されていれば、作成できる" do
        expect(@habit).to be_valid
      end
      it "contentがなくても、作成できる" do
        @habit.content = ""
        expect(@habit).to be_valid
      end
    end
    context "上手くいかない場合" do
      it "nameが空では作成できない" do
        @habit.name = ""
        @habit.valid?
        expect(@habit.errors.full_messages).to include("習慣名を入力してください")
      end
      it "nameが20文字以上では作成できない" do
        @habit.name = Faker::Lorem.characters(number: 21)
        @habit.valid?
        expect(@habit.errors.full_messages).to include("習慣名は20文字以内で入力してください")
      end
      it "contentが500文字以上では作成できない" do
        @habit.content = Faker::Lorem.characters(number: 501)
        @habit.valid?
        expect(@habit.errors.full_messages).to include("内容は500文字以内で入力してください")
      end
      it "frequencyが空では作成できない" do
        @habit.frequency = nil
        @habit.valid?
        expect(@habit.errors.full_messages).to include("実行頻度を入力してください")
      end
      it "projectが紐づいていなければ作成できない" do
        @habit.project = nil
        @habit.valid?
        expect(@habit.errors.full_messages).to include("Projectを入力してください")
      end
    end
  end
end
