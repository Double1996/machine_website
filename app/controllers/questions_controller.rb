class QuestionsController < ApplicationController
  def new
    if current_user.role = 1
      @question = Question.new
    end
  end

  def show
  end

  def destroy
    Question.find_by(params[:id]).destroy
    flash[:success] = "题目已经被删除"
    redirect_to question_url
  end

  #设置正确的选项
  def set_right_option
    
  end

  private
  def question_params
    params.require(:question).permit(:content, :options， :type)
  end
end
