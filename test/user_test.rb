require "test_helper"
require 'minitest/spec'
require 'minitest/autorun'

class UserTest < Minitest::Spec
  def setup
    @user = User.new

    @setup_user = User.new
    @setup_user.email = "Test@email.com"
    @setup_user.name = "Tom Jones"
    @setup_user.password = 'herpderp'
    @setup_user.password_confirmation = 'herpderp'
    @setup_user.save!
  end

  def test_creation_validation
    refute @user.save()

    @user.email = "validate@email.com"
    @user.name = "Tom Jones"
    @user.password = 'herpderp'
    @user.password_confirmation = 'herpderp'
    assert @user.save()
  end

  def test_todays_date_generation
    @old_entry = Entry.new
    @old_entry.created_at = "2012-02-27 00:00:00"
    @setup_user.entries << @old_entry

    refute_equal @setup_user.todays_entry(), @old_entry

    @new_entry = Entry.new
    @new_entry.text = "To make sure the entries would be different"
    @new_entry.save!
    @setup_user.entries << @new_entry

    assert_equal @setup_user.todays_entry(), @new_entry
  end
end