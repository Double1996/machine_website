class Question < ApplicationRecord
  belongs_to :exam
  has_many :response_options, dependent: :destroy

  validates :text, length: {within: 1..200}, allow_nil: true


  def self.question_types
    [
        ["选择题", "multi"],
        ["填空题", "fill"]
    ]
  end

  def has_no_options?
    self.response_options.any?
  end

  def has_content?
    self.content
  end

  def has_no_content?
    !has_content?
  end




end
