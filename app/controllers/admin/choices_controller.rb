class Admin::ChoicesController < Admin::ApplicationController
  def index
    @exam = Exam.includes(:questions => :response_options).find(params[:exam_id])
  end

  def choose
    exam_id = params[:exam_id]
    type = params[:question_type]
    case type
      when "multi"
        redirect_to new_admin_question_path(:exam_id => exam_id)
      when "fill"
        redirect_to new_admin_question_path(:exam_id => exam_id, :option_time => 0 )
      else
        redirect_to admin_choose_path
    end
  end

end
