# MachineWebsite Application

这是我个人毕业设计 为太原工业学院机械工程系建设的[*《机械工程材料》教学网站*](http://www.loujuhong.cn)。

## Power By
- Ruby on Rails
- Mysql
- Bootstrap
- HomeLand

## 主要功能

```
1. 在线教学视频(优酷)
2. 后台管理
3. 在线考试
4. 机械社区
5. 个人微博
```

## 大感谢

- [*厦门创意社科技公司*](http://www.tshe.com)
- 太原工业学院机械工程系
- 杨瑞（老板）
- 任文慧（前女友，本网站第一个用户）

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ cd ~/tmp
$ git clone https://github.com/ForrestDouble/machine_website.git
$ cd paper
$ bundle install
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

On Cloud9, this command should be

```
$ rails server -b $IP -p $PORT
```

instead.

To check out the code for a particular chapter, use

```
$ git checkout chapter-branch-name
```

where you can find the branch name using

```
$ git branch -a
```