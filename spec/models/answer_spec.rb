require 'rails_helper'

RSpec.describe Answer, type: :model do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }
  let!(:answer) { create(:answer) }

  describe "バリデーションテスト" do
    context "回答が成功する場合" do
      it "有効な情報であればコメントできること" do
        expect(answer).to be_valid
      end
    end

    context "回答が失敗する場合" do
      it "user_idがなければ回答できないこと" do
        answer.user_id = nil
        answer.valid?
        expect(answer).to be_invalid
      end

      it "post_idがなければ回答できないこと" do
        answer.post_id = nil
        answer.valid?
        expect(answer).to be_invalid
      end

      it "episodeがなければ回答できないこと" do
        answer.episode = nil
        answer.valid?
        expect(answer.errors.full_messages).to include("エピソードを入力してください")
      end

      it "episodeが9文字以下の場合は登録できないこと" do
        answer = build(:answer, episode: "a" * 9)
        answer.valid?
        expect(answer).to be_invalid
      end

      it "episodeが1001文以上字の場合は登録できないこと" do
        answer = build(:answer, episode: "a" * 1001)
        answer.valid?
        expect(answer).to be_invalid
      end

      it "回答(content)がなければ回答できないこと" do
        answer.content = nil
        answer.valid?
        expect(answer.errors.full_messages).to include("回答を入力してください")
      end

      it "回答が9文字以下の場合は登録できないこと" do
        answer = build(:answer, content: "a" * 9)
        answer.valid?
        expect(answer).to be_invalid
      end

      it "回答が1001文字以上の場合は登録できないこと" do
        answer = build(:answer, content: "a" * 1001)
        answer.valid?
        expect(answer).to be_invalid
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

    context "postとの関連" do
      let(:target) { :post }

      it "postとの関連はbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "commentとの関連" do
      let(:target) { :comments }

      it "commentとの関連はhas_manyであること" do
        expect(association.macro).to eq :has_many
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
