class Admin::UsersController < Admin::ApplicationController
  def index
    case params[:by]
      when 'normal'
        @value = 2
        @users = User.normal.paginate page: params[:page], per_page: MAX_IN_PAGE
      when 'admin'
        @value = 3
        @users = User.admin.paginate page: params[:page], per_page: MAX_IN_PAGE
      when 'disabled'
        @value = 4
        @users = User.disabled.paginate page: params[:page], per_page: MAX_IN_PAGE
      else
        @value = 1
        @users = User.all.paginate page: params[:page], per_page: MAX_IN_PAGE
    end
  end

  def destroy
    @user = User.find_by username: params[:id]
    if @user
      @user.destroy
      flash[:success] = "#{@user}用户已经删除"
    else
      flash[:warning] = "#{@user}用户没用找到"
    end
    redirect_to admin_users_path
  end

  def edit
    @edit_user = User.find_by username: params[:id]
    if @edit_user.blank?
      flash[:warning] = "#{@user}用户没用找到"
      redirect_to admin_users_path
    end
  end

  def update
    @edit_user = User.find_by username: params[:id]
    if @edit_user.blank?
      flash[:warning] = "#{@user}用户没用找到"
      return redirect_to admin_users_path
    end

    # @edit_user.update_attributes edit_user_params
    # if @edit_user.errors.include?(:email) || @edit_user.errors.include?(:username)
    #   flash.now[:warning] = I18n.t "flash.warning.username_or_email_has_existed"
    # else
    #   @edit_user.update_attributes_by_each edit_user_params
    #   flash.now[:success] = I18n.t "flash.success.update_account"
    # end
    # @edit_user.reload
    render 'edit'
  end

  def edit_user_params
    params.require(:user).permit :username, :email, :activated
  end

end