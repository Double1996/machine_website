class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "账号激活"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "密码重置"
  end
end
