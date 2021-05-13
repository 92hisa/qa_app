class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :ensure_domain
  FQDN = 'www.keiken.info'.freeze

  def ensure_domain
    return unless /\.herokuapp.com/ =~ request.host

    # 主にlocalテスト用の対策80と443以外でアクセスされた場合ポート番号をURLに含める
    port = ":#{request.port}" unless [80, 443].include?(request.port)
    redirect_to "#{request.protocol}#{FQDN}#{port}#{request.path}", status: :moved_permanently
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :birth_date])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_image, :about_me])
  end
end
