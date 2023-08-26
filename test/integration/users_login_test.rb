require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:hulkster)
  end

  test "login with valid information" do
    get login_path

    assert_template "sessions/new"
    post login_path, params: { session: { email: @user.email, password: "password" } }

    assert_redirected_to @user
    follow_redirect!

    assert_template "users/show"
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end

  test "log in, then log out" do
    get login_path

    # assert_template "sessions/new"
    # post login_path, params: { session: { email: @user.email, password: "password" } }

    # assert_redirected_to @user
    # follow_redirect!

    # assert_template "users/show"
    # assert logged_in?
    log_in(User.first)

    delete logout_path

    assert_not logged_in?
    assert_redirected_to root_url
    follow_redirect!

    assert_template "static_pages/home"
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

  test "login with invalid information" do
    get login_path

    assert_template "sessions/new"
    post login_path, params: { session: { email: "", password: "" } }

    assert_response :unprocessable_entity
    assert_template "sessions/new"
    assert_not flash.empty?
    get root_path

    assert_empty flash
  end

  test "valid signup information" do
    assert_difference "User.count", 1 do
      post users_path, params: { user: { name: "Example User", email: "foo@example.com", password: "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!

    assert_template "users/show"
    assert logged_in?
  end
end
