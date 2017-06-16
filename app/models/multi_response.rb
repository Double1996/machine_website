class MultiResponse < ApplicationRecord
  belongs_to :respondent, optional: true
  belongs_to :question

  has_many :join_options
  has_many :response_options, through: :join_options

  validates :response_option_ids, presence: true, if: "Question.find_by_id(question_id).required?"

  def option_choosed?(option_to_choose)
    self.response_options.pluck(:id).include?(option_to_choose.id) ? true : false
  end


end
