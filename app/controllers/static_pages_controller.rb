class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @topics = Homeland::Node.find_by(name: '机械新闻').topics.limit(3)
  end

  def help
  end

  def about
  end

  def contact
  end
end
