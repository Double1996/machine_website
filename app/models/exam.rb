class Exam < ApplicationRecord
  has_many :questions, dependent: destroy
  has_many :respondents,  dependent: destroy

  validates :title, length: {within: 1..100}, presence: true
  validates :description, length: {within: 1...1000}, presence: true




end
