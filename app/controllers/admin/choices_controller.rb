class Admin::ChoicesController < Admin::ApplicationController
  def index
    @exam = Exam.includes(:questions => :response_options).find(params[:exam_id])
  end

  def choose
    exam_id = params[:exam_id]
    choice = params[:question_type]
    case choice
      when "multi"
        redirect_to admin_new_question_path(:exam_id => exam_id)
      when "fill"
        # redirect_to new_num_range_path(:exam_id => exam_id)
      else
        flash[:dander] = ["错误的问题类型"]
        redirect_to root_path
    end
  end

end
