class QiniusController < ApplicationController
  def index

  end

  def show
    @qiniu = Qiniu.find(params[:id])
  end

  private
  def qiniu_params

  end
end
