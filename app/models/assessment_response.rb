class AssessmentResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :assessment
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  def update_to_reflect_assessment
    for question in assessment.questions
      if(answers.find_by_question_id(question.id).nil?)
        answer = self.answers.new
        answer.question = question
      end
    end
    self.save
  end
end
