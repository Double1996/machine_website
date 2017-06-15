module QuestionsHelper
  def store_referer
    session[:referer] = request.referer
  end

  def referer
    session.delete(:referer)
  end

  def exam_includes
    Exam.includes({:questions => :response_options})
  end

  def redirect_path_for_update question
    if question.has_no_options?
      redirect_to new_admin_response_option_path(:question_id => question.id)
    else
      redirect_to admin_choices_path(:exam_id => question.exam_id)
    end
  end
end
