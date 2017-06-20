class Admin::ExamsController < Admin::ApplicationController
  def index
    @exams = Exam.all.order(:id).reverse_order
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      flash[:success] = "考试: #{@exam.title} 已经被创建了"
      redirect_to admin_choices_path(:exam_id => @exam.id)
    else
      flash[:danger] = @exam.errors.full_messages
      render :new
    end
  end

  def edit
    @exam = Exam.find_by_id(params[:id])
  end

  def destroy
    exam = Exam.find_by_id(params[:id])
    if exam && exam.destroy
      flash[:success] = ["这次考试已经被删除了"]
      redirect_to root_path
    else
      flash[:danger] = exam.errors.full_messages
      redirect_to root_path
    end
  end

  def show
    exam = Exam.find_by_id(params[:id])
    if exam
      @respondents = exam.respondents
      unless @respondents
        flash[:danger] = ["这次考试暂无答卷"]
        redirect_to redirect_back_path
      end
    else
      flash[:danger] = ["这次考试没有"]
      redirect_to redirect_back_path
    end
  end

  private
  def exam_params
    params.require(:exam).permit(:title, :description)
  end
end