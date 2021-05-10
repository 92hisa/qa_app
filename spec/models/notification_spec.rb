require 'rails_helper'

RSpec.describe Notification, type: :model do
  let!(:notification) { create(:notification) }

  describe "バリデーションテスト" do
    context "登録ができるとき" do
      it "有効な情報であれば登録できること" do
        expect(notification).to be_valid
      end
    end

    context "登録ができないとき" do
      it "visitor_idがなければ登録できないこと" do
        notification.visitor_id = nil
        notification.valid?
        expect(notification).to be_invalid
      end

      it "visited_idがなければ登録できないこと" do
        notification.visited_id = nil
        notification.valid?
        expect(notification).to be_invalid
      end
    end
  end

  describe "関連付けテスト" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "userとの関連" do
      let(:target) { :visitor }

      it "visitorとの関連はbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "visitedとの関連" do
      let(:target) { :visited }

      it "visitedとの関連はbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "postとの関連" do
      let(:target) { :post }

      it "postとの関連はbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "answerとの関連" do
      let(:target) { :answer }

      it "answerとの関連はbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "commentとの関連" do
      let(:target) { :comment }

      it "commentとの関連はbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
