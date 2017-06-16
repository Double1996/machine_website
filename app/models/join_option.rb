class JoinOption < ApplicationRecord
  belongs_to :response_option
  belongs_to :multi_responses
end
