# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_name   (name) UNIQUE
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "

    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "   "

    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 256

    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 256

    assert_not @user.valid?
  end

  test "email should be valid" do
    @user.email = "user@example,com"

    assert_not @user.valid?
  end

  test "email should be unique" do
    @user.save
    duplicate_user = @user.dup

    assert_not duplicate_user.valid?
  end

  test "name should be unique" do
    @user.save
    duplicate_user = @user.dup
    duplicate_user.email.upcase!

    assert_not duplicate_user.valid?
  end

  test "email should be saved as lower-case" do
    mixed_case_email = "Foo@EXAMPLE.cOm"
    @user.email = mixed_case_email
    @user.save

    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
