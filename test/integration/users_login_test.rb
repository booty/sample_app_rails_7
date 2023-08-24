require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  get login_path

  assert_template "sessions/new"
  post login_path, params: { session: { email: "", password: "" } }

  assert_response :unprocessable_entity
  assert_template "sessions/new"
  assert_not flash.empty?
  get root_path

  assert_empty flash
end
