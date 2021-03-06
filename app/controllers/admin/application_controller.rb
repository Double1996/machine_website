class Admin::ApplicationController < ApplicationController
  before_action :logged_in_user
  before_action :check_activated
  before_action :check_admin
  before_action :get_current_user, except: [:destroy]
  protect_from_forgery with: :exception

  layout 'admin'

  MAX_IN_PAGE = 15

  def get_current_user
    @user = current_user
  end

  def redirect_back_path
    request.referer || root_path
  end

  def export_csv(data, filename)
    send_data "\xEF\xBB\xBF#{data}",
              type: 'text/csv; charset=utf-8; header=present',
              disposition: "attachment; filename=#{filename}"
  end

end