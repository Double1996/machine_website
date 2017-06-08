class ExamsController < ApplicationController

  def index
    @exams = Exam.all.order(:id).reverse_order
  end


  private

  def exam_params
    params.require(:exam).permit(:title, :description)
  end
end
