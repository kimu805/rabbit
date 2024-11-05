require 'rails_helper'

RSpec.describe CheckIn, type: :model do
  before do
    @habit = FactoryBot.create(:habit)
    @check_in = FactoryBot.build(:check_in, habit_id: @habit.id)
  end
  describe "新規作成" do
    context "上手くいく場合" do
      it "全ての情報が適切に入力されていれば、作成できる" do
        expect(@check_in).to be_valid
      end
    end
    context "上手くいかない場合" do
      it "habitが紐づいていなければ登録できない" do
        @check_in.habit = nil
        @check_in.valid?
        expect(@check_in.errors.full_messages).to include("Habitを入力してください")
      end
    end
  end
end
