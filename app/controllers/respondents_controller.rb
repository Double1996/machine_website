class RespondentsController < ApplicationController
  before_action :logged_in_user

  def new
    @exam = Exam.find_by_id(params[:exam_id])
    @respondent = Respondent.new
    @respondent.multi_responses.build
  end


  def create
    @exam = Exam.includes(:questions => :response_options).find_by_id(params[:respondent][:exam_id])
    @respondent = Respondent.new(respondent_params)
    if @respondent.save
      flash[:success] = ["谢谢你的答卷，祝你好运"]
      redirect_to redirect_back_path
    else
      flash.now[:danger] = @respondent.errors.full_messages
    end
  end

  private

  def respondent_params
    params.require(:respondent).permit(
        :name,
        :exam_id,
        :student_id,
        :student_name,
        {
            :multi_responses_attributes => [
                :question_id,
                :response_option_ids,
                :response_option_ids => []
            ]
        })
  end
end

