require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      first_name: 'Example',
      last_name: 'User',
      email: 'user@example.com',
      password: 'foobar',
      password_confirmation: 'foobar'
    )
  end

  test 'should be valid' do
    assert @user.valid?
  end

  ##### First Name
  test 'first name should be present' do
    @user.first_name = '   '
    assert_not @user.valid?
  end

  test 'first name should not be too long' do
    @user.first_name = 'a' * 52
    assert_not @user.valid?
  end

  ##### Last Name
  test 'last name should be present' do
    @user.last_name = '   '
    assert_not @user.valid?
  end

  test 'last name should not be too long' do
    @user.last_name = 'a' * 52
    assert_not @user.valid?
  end

  ##### Email
  test 'email should be present' do
    @user.email = '   '
    assert_not @user.valid?
  end

  test 'email should be unique' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  ##### Password
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
