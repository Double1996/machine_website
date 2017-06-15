class ResponseOption < ApplicationRecord
  belongs_to :question

  has_many :join_options

end
