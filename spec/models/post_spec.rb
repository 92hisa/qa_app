require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }

  describe "バリデーションテスト" do
    context "登録ができるとき" do
      it "有効な情報であれば登録できること" do
        expect(post).to be_valid
      end

      it "画像がなくても登録できること" do
        post.post_image = nil
        post.valid?
        expect(post).to be_valid
      end
    end

    context "登録できないとき" do
      it "user_idがなければ登録できないこと" do
        post.user_id = nil
        post.valid?
        expect(post).to be_invalid
      end

      it "categoryr_idがなければ登録できないこと" do
        post.category_id = nil
        post.valid?
        expect(post).to be_invalid
      end

      it "statusがなければ登録できないこと" do
        post.status = nil
        post.valid?
        expect(post).to be_invalid
      end

      it "タイトルがなければ登録できないこと" do
        post.title = nil
        post.valid?
        expect(post.errors.full_messages).to include("タイトルを入力してください")
      end

      it "タイトルが４文字以下の場合は登録できないこと" do
        post = build(:post, title: "aaaa")
        post.valid?
        expect(post).to be_invalid
      end

      it "タイトルが101文字以下の場合は登録できないこと" do
        post = build(:post, title: "a" * 101)
        post.valid?
        expect(post).to be_invalid
      end

      it "質問がなければ登録できないこと" do
        post.content = nil
        post.valid?
        expect(post.errors.full_messages).to include("質問を入力してください")
      end

      it "質問が４文字以下の場合は登録できないこと" do
        post = build(:post, content: "aaaa")
        post.valid?
        expect(post).to be_invalid
      end

      it "質問が1001文字以上の場合は登録できないこと" do
        post = build(:post, content: "a" * 1001)
        post.valid?
        expect(post).to be_invalid
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

    context "categoryとの関連" do
      let(:target) { :category }

      it "categoryとの関連はbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "notificationとの関連" do
      let(:target) { :notifications }

      it "notificationとの関連はhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
    end

    context "likeとの関連" do
      let(:target) { :likes }

      it "likeとの関連はhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
    end

    context "answerとの関連" do
      let(:target) { :answers }

      it "answerとの関連はhas_manyであること" do
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
