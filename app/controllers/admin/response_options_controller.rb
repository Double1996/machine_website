class Admin::ResponseOptionsController < Admin::ApplicationController
  def new
    questions = Question.includes(:response_options)
    @question = questions.find_by_id(params[:question_id])
    @question.response_options.build
    exam = Exam.includes(:questions => :response_options)
    @exam = exam.find_by_id(@question.exam_id)
  end

  def create

  end

end