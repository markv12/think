require "test_helper"

class QuestionCategoryTest < ActiveSupport::TestCase

  def question_category
    @question_category ||= QuestionCategory.new
  end

  def test_valid
    assert question_category.valid?
  end

end
