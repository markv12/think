require "test_helper"

class AssessmentTest < ActiveSupport::TestCase

  def assessment
    @assessment ||= Assessment.new
  end

  def test_valid
    assert assessment.valid?
  end

end
