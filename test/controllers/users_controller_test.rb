# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: 'testuser', password: 'password', email: 'test@whatever.com',
                              first_name: 'test', last_name: 'test', bio: 'This is a test', admin: true)
  end

  test 'should get users index' do
    sign_in_as(@admin_user)
    get users_url
    assert_response :success
  end

  test 'should get signup page' do
    get signup_url
    assert_response :success
  end

  test 'Gets redirected when not signed in by restricted links' do
    get users_url
    assert_response 302
    get friends_url
    assert_response 302
    get root_url
    assert_response 302
  end
end
