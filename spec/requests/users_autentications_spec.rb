require "rails_helper"

RSpec.describe "GET #edit", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  describe '登録情報の変更' do
    context "ログインしている場合" do
      before do
        user.confirm
        sign_in user
      end

      it 'リクエストが成功すること' do
        get edit_user_registration_path
        expect(response.status).to eq 200
      end
    end

    context 'ログインしていない場合' do
      before do
        get edit_user_registration_path
      end

      it "ログインページへリダイレクトすること" do
        expect(response).to redirect_to user_session_path
      end
    end
  end

  describe "登録情報変更（#update）" do
    let!(:params) { { user: { name: "user_2" } } }

    context "ログインしてる場合" do
      before do
        user.confirm
        sign_in(user)
        put user_registration_path, params: params
      end

      it "正常なレスポンスを返すこと" do
        expect(response.status).to eq 302
      end
      it "編集した内容に更新されること" do
        expect(user.reload.name).to eq "user_2"
      end
      it "マイページにリダイレクトすること" do
        expect(response).to redirect_to mypage_user_path(id: user.id)
      end
    end

    context "ログインしてない場合" do
      it "トップページへリダイレクトすること" do
        put user_registration_path, params: params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
