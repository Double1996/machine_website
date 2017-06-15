class ExamsController < ApplicationController

  def index
    @exams = Exam.all.order(:id).reverse_order
  end


  private

  def exam_params
    params.require(:exams).permit(:title, :description)
  end
end
