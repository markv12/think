require "test_helper"
require 'minitest/spec'
require 'minitest/autorun'

class EntryTest < Minitest::Spec
  def setup
    @entry = Entry.new
  end

  def test_wordcount
    @entry.text = ""
    assert_equal 0, @entry.wordcount

    @entry.text = "A standard string with no funny business"
    assert_equal 7, @entry.wordcount

    @entry.text = "Something Else \n something confusing \t good luck"
    assert_equal 6, @entry.wordcount
  end
end