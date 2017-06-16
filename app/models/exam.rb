class Exam < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :respondents, dependent: :destroy

  validates :title, length: {within: 1..100}, presence: true
  validates :description, length: {within: 1...1000}, presence: true


  def has_questions?
    self.questions.any? ? true : false
  end

  def has_no_questions?
    !has_no_questions?
  end

  def has_no_multi_questions_with_text?
    all_questions = self.questions
    if all_questions.empty?
      return true
    elsif all_questions.all?(&:has_no_text?)
      return true
    else
      return false
    end
  end

  def has_multi_questions?
    !has_no_multi_questions_with_text?
  end


  def all_multi_questions_with_text
    self.questions.where.not(text: nil)
  end

end
