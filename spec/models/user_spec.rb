require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe "バリデーションテスト" do
    context "登録ができる場合" do
      it "正しい情報を入力すれば登録できること" do
        expect(user).to be_valid
      end

      it "画像がなくても登録できること" do
        user.profile_image = nil
        expect(user).to be_valid
      end

      it "紹介文がなくても登録できること" do
        user.about_me = nil
        expect(user).to be_valid
      end
    end

    context "登録ができない場合" do
      it "名前がなければ登録ができない" do
        user.name = nil
        user.valid?
        expect(user.errors.full_messages).to include("名前を入力してください")
      end

      it "名前がすでに存在する場合は登録ができない" do
        user_second = FactoryBot.create(:user)
        user.name = user_second.name
        user.valid?
        expect(user.errors.full_messages).to include("名前はすでに存在します")
      end

      it "メールアドレスがなければ登録ができない" do
        user.email = nil
        user.valid?
        expect(user.errors.full_messages).to include("メールアドレスを入力してください")
      end

      it "メールアドレスがすでに存在する場合は登録ができない" do
        user_third = FactoryBot.create(:user)
        user.email = user_third.email
        user.valid?
        expect(user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end

      it "パスワードがなければ登録できない" do
        user.password = nil
        user.valid?
        expect(user.errors.full_messages).to include("パスワードを入力してください")
      end

      it "パスワード(確認用)がなければ登録できない" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors.full_messages).to include("パスワード（確認用）を入力してください")
      end

      it "パスワードとパスワード(確認用)が一致しなければ登録できない" do
        user = build(:user, password_confirmation: "aaaaaa")
        user.valid?
        expect(user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "パスワードが7文字未満の場合は登録ができない" do
        user = build(:user, password: "a" * 6)
        user.valid?
        expect(user.errors.full_messages).to include("パスワードは7文字以上で入力してください")
      end

      it "生年月日がなければ登録ができない" do
        user.birth_date = nil
        user.valid?
        expect(user.errors.full_messages).to include("生年月日を入力してください")
      end

      it "性別が未入力の場合は登録ができない" do
        user.gender = nil
        user.valid?
        expect(user.errors.full_messages).to include("性別を入力してください")
      end

      it "is_deletedが未入力の場合は登録ができない" do
        user.is_deleted = nil
        user.valid?
        expect(user).to be_invalid
      end
    end
  end

  describe "関連付けテスト" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "postとの関連" do
      let(:target) { :posts }

      it "postとの関連はhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
    end

    context "answerとの関連" do
      let(:target) { :answers }

      it "answerとの関連はhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
    end

    context "likeとの関連" do
      let(:target) { :likes }

      it "likeとの関連はhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
    end

    context "commentとの関連" do
      let(:target) { :comments }

      it "commentとの関連はhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
    end

    context "active_notificationとの関連" do
      let(:target) { :active_notifications }

      it "active_notificationとの関連はhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
    end

    context "passive_notificationとの関連" do
      let(:target) { :passive_notifications }

      it "passive_notificationとの関連はhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
    end
  end
end
