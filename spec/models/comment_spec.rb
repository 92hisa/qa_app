require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  let!(:answer) { create(:answer) }
  let!(:comment) { create(:comment) }

  describe "バリデーションテスト" do
    context "コメントが成功する場合" do
      it "有効な情報であればコメントできること" do
        expect(comment).to be_valid
      end

      it "有効な情報であればコメントに登録きること" do
        expect(comment).to be_valid
      end
    end

    context "コメントが失敗する場合" do
      it "user_idがなければコメントできないこと" do
        comment.user_id = nil
        comment.valid?
        expect(comment).to be_invalid
      end

      it "answer_idがなければコメントできないこと" do
        comment.answer_id = nil
        comment.valid?
        expect(comment).to be_invalid
      end

      it "コメント(content)がなければコメントできないこと" do
        comment.content = nil
        comment.valid?
        expect(comment.errors.full_messages).to include("コメントを入力してください")
      end

      it "コメントが301文字以上の場合は登録できないこと" do
        comment = build(:comment, content: "a" * 301)
        comment.valid?
        expect(comment).to be_invalid
      end
    end
  end

  describe "関連付けテスト" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "userとの関連" do
      let(:target) { :user }

      it "userとの関連はbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "answerとの関連" do
      let(:target) { :answer }

      it "answerとの関連はbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "notificationとの関連" do
      let(:target) { :notifications }

      it "notificationとの関連はhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
    end
  end
end
