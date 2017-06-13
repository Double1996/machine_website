class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  include SessionsHelper


  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "请登录！"
      redirect_to login_url
    end
  end

  # 确保用户是管理员
  def check_admin
    return render_404 if current_user.blank? || !current_user.admin?
  end

  def check_activated
    return if current_user.blank?
    unless current_user.activated?
      flash[:danger] = "请激活您的账号"
      redirect_to root_path
    end
  end

  def set_locale
    I18n.locale = 'zh-CN'
  end

end