require 'rails_helper'

RSpec.describe Habit, type: :model do
  before do
    @project = FactoryBot.create(:project)
    @habit = FactoryBot.build(:habit, project_id: @project.id)
  end
  describe "新規作成" do
    context "上手くいく場合" do
      it "全ての情報が正しく入力されていれば、作成できる" do

      end
      it "contentがなくても、作成できる" do

      end
    end
    context "上手くいかない場合" do
      it "nameが空では作成できない" do

      end
      it "nameが20文字以上では作成できない" do

      end
      it "contentが500文字以上では作成できない" do

      end
      it "frequencyが空では作成できない" do

      end
      it "frequencyは1～7以外の数値は入力できない" do

      end
    end
  end
end
