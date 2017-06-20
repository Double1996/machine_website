class Admin::RespondentsController < Admin::ApplicationController

  def edit
    @respondent = Respondent.find(params[:id])
  end

  def update
    @respondent = Respondent.find_by_id(params[:id])
    @respondent.update(respondent_params)
    if @respondent.results
      if @respondent.results
        flash[:success] = "考生成绩添成功"
        redirect_to admin_exams_path
      end
    else
      flash[:danger] = '添加成绩失败'
      render 'edit'
    end
  end

  private
  def respondent_params
    params.require(:respondent).permit(
        :name,
        :exam_id,
        :student_id,
        :student_name,
        :results,
        {
            :multi_responses_attributes => [
                :question_id,
                :response_option_ids,
                :response_option_ids => []
            ]
        })
  end

end