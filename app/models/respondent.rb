class Respondent < ApplicationRecord
  has_many :multi_responses, dependent: :destroy
  accepts_nested_attributes_for :multi_responses,
                                :reject_if => :all_blank,
                                :allow_destroy => true;

  belongs_to :exam

  def choosed?(option)
    if self.has_multi_responses?
      self.multi_responses.any? do |multi_response|
        multi_response.option_choosed?(option)
      end
    end
  end

  def has_multi_responses?
    self.multi_responses.empty? ? false : true
  end

end
