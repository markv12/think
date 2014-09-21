require "test_helper"

class QuestionTypeTest < ActiveSupport::TestCase

  def question_type
    @question_type ||= QuestionType.new
  end

  def test_valid
    assert question_type.valid?
  end

end
