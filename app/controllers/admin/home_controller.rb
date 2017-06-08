class Admin::HomeController < Admin::ApplicationController

  def index
    @summary = {
        user: {total: User.all.size, admin: User.admin.size}
    }
  end

end
