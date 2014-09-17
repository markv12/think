class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :assessment_response
end
