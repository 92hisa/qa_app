require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }
  let!(:like) { create(:like) }

  describe "バリデーションテスト" do
    context "いいね！が保存できる場合" do
      it "有効な情報であればいいね！できること" do
        expect(like).to be_valid
      end
    end

    context "いいね！が保存できない場合" do
      it "user_idがなければいいね！できないこと" do
        like.user_id = nil
        like.valid?
        expect(like).to be_invalid
      end
    end

    it "post_idがなければいいね！できないこと" do
      like.post_id = nil
      like.valid?
      expect(like).to be_invalid
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
  end
end
