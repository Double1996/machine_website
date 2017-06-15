class Exam < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :respondents,  dependent: :destroy

  validates :title, length: {within: 1..100}, presence: true
  validates :description, length: {within: 1...1000}, presence: true



  def has_questions?
    self.questions.empty? ? true : false
  end

  def has_no_questions?
    !has_no_questions?
  end


end
