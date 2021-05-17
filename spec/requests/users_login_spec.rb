require "rails_helper"

RSpec.describe "User login", type: :request do
  let!(:user) { create(:user) }

  describe "マイページ(#show)を表示する場合" do
    context "ログインしている場合" do
        before do
          user.confirm
          sign_in(user)
        end

      context "本人の場合" do
        it "正常なレスポンスを返すこと" do
          get user_path(user)
          expect(response).to be_successful
          expect(response.status).to eq 200
        end
      end
    end

    context "ログインしていない場合" do
      it "ログインページへリダイレクトすること" do
        get user_path(user)
        expect(response).to redirect_to user_session_path
      end
    end
  end
end
