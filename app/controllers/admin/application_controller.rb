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

end