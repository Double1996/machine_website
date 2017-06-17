class Admin::VideosController < Admin::ApplicationController
  def index
    @videos = Video.all.order(:id).reverse_order
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      new_url = @video.url.gsub('480', '864').gsub('400', '720')
      if @video.update_attribute(:url, new_url)
        flash[:success] = "视频: #{@video.name} 已经被创建了"
        redirect_to admin_videos_path
      end
    else
      flash[:danger] = @video.errors.full_messages
      render :new
    end
  end

  def destroy
    @video = Video.find(params[:id])
    if @video && @video.destroy
      flash[:success] = "视频已经删除"
      redirect_to admin_videos_path
    else
      flash[:danger] = "视频删除失败"
      redirect_to admin_videos_path
    end
  end

  private
  def video_params
    params.require(:video).permit(:name, :url, :context)
  end
end