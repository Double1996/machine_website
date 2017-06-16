class Admin::ChoicesController < Admin::ApplicationController
  def index
    @exam = Exam.includes(:questions => :response_options).find(params[:exam_id])
  end

  def choose
    exam_id = params[:exam_id]
    time = params[:question_type]
    case time
      when "multi"
        redirect_to new_admin_question_path(:exam_id => exam_id)
      when "fill"
        # redirect_to new_num_range_path(:exam_id => exam_id)
      else
        redirect_to new_admin_question_path(:exam_id => exam_id)
    end
  end

end
