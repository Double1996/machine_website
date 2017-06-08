class RespondentsController < ApplicationController
  def new
    @exam = Exam.find_by_id(params[:survey_id])
    @respondent = Respondent.new
  end

  private
  def respondent_params
    params.require(:respondent).permit(:name, :survey_id,)

  end
end

