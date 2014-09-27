class Assessment < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_one :user, :foreign_key => :daily_assessment_id
  has_many :questions, dependent: :destroy
  has_many :assessment_responses, dependent: :destroy

  def create_empty_response
    response = assessment_responses.new

    for question in questions
      answer = response.answers.new
      answer.question = question
    end
    response
  end

  def todays_response
    most_recent_response = self.assessment_responses.sort_by(&:created_at).last
    if(most_recent_response.nil? || most_recent_response.created_at.to_date != Date.current)
      most_recent_response = self.create_empty_response
      most_recent_response.user = self.user
      most_recent_response.save!
    end
    return most_recent_response
  end
end
