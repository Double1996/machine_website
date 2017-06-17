class VideosController < ApplicationController

  def index
    @videos = Video.all.order(:id).reverse_order
  end

  def show
    @video = Video.find(params[:id])
    render html: "#{@video.url}".html_safe
  end

end
