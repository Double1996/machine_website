class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    if Homeland::Node.find_by(name: '机械新闻').blank?
      @topics = nil
    else
      @topics = Homeland::Node.find_by(name: '机械新闻').topics.limit(3)
    end

  end

  def help

  end

  def about
  end

  def contact
  end

  def paper1

  end

  def paper2

  end

  def paper3

  end

  def paper4

  end

  def paper5

  end
end
