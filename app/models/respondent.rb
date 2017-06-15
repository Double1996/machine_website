class Respondent < ApplicationRecord
  has_many :multi_responses, dependent: :destroy

  belongs_to :exam

end
