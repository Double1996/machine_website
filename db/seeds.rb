# 创建管理员用户
User.create!(name:  "root",
             email: "root@qq.com",
             password:              "19961010",
             password_confirmation: "19961010",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)