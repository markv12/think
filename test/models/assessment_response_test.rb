require "test_helper"

class AssessmentResponseTest < ActiveSupport::TestCase

  def assessment_response
    @assessment_response ||= AssessmentResponse.new
  end

  def test_valid
    assert assessment_response.valid?
  end

end
