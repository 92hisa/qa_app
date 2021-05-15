class Users::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected

  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to new_user_sessio_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
      redirect_to new_user_sessio_path
    end
  end
end
