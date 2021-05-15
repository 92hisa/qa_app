class OperationsController < ApplicationController
  def kiyaku
  end

  def privacy
  end

  def registration_complete
  end

  def anounce
  end

  def question

  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'keiken.kanri@gmail.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation= user.password
      user.birth_date = 1900-01-01
      user.confirmed_at = Time.now
      user.name = "ゲスト"
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
