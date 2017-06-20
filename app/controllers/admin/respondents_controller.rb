class Admin::RespondentsController < Admin::ApplicationController

  def edit
    @respondent = Respondent.find(params[:id])
  end

  def update
    @respondent = Respondent.find_by_id(params[:id])
    results = params[:results]
    @respondent.update_attribute(:results, results)
    if @respondent.results
      if @respondent.results
        flash[:success] = "考生成绩添成功"
      end
    else
      flash[:danger] = '添加成绩失败'
    end
    render 'edit'
  end

end