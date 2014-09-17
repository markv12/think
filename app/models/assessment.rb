class Assessment < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :questions, dependent: :destroy
  has_many :assessment_responses, dependent: :destroy

  def create_empty_response
    response = assessment_responses.new

    for question in questions
      answer = response.answers.new
      answer.question = question
      answer
    end
    response
  end
end
