class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :assessment_response

  delegate :question_type, to: :question
  delegate :partial_location, to: :question
  delegate :daily_partial_location, to: :question
  delegate :scale_min, to: :question
  delegate :scale_max, to: :question
end
