class AssessmentResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :assessment
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers
end
