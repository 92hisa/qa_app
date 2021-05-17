require "rails_helper"

RSpec.describe "Posts", type: :request do
  let!(:user) { create(:user) }
  let!(:category) { create(:category) }
  let!(:new_post) { create(:post, user: user, category_id: category.id) }
  let!(:post_params) { attributes_for(:post) }
  let!(:invalid_post_params) { attributes_for(:post, title: "") }

  describe "ログインしている場合" do
    before do
      user.confirm
      sign_in(user)
      get new_post_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to be_successful
      expect(response.status).to eq 200
    end

    it "無効なデータでは登録できないこと" do
      expect {
        post posts_path, params: { post: invalid_post_params }
      }.not_to change(Post, :count)
    end
  end

  describe "ログインしていない場合" do
    before do
      get new_post_path
    end

    context "投稿画面へアクセスしたとき" do
      it "トップページへリダイレクトすること" do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
