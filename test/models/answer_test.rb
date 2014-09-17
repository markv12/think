require "test_helper"

class AnswerTest < ActiveSupport::TestCase

  def answer
    @answer ||= Answer.new
  end

  def test_valid
    assert answer.valid?
  end

end
