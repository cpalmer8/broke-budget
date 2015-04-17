require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Test User", email: "test@example.com",
			password: "password", password_confirmation: "password")
  end

  test "is user valid" do
    assert @user.valid?
  end

  test "name should not be blank" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "email should not be blank" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should be a valid email address" do
    invalid_addresses = %w[user@invalid,com, user_at_invalid.org, username@invalid,
                                user@in_valid.com, user@in_valid.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address} should be invalid"
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

end
