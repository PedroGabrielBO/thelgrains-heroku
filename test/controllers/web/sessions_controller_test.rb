require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  setup do
    @web_session = web_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:web_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create web_session" do
    assert_difference('Web::Session.count') do
      post :create, web_session: {  }
    end

    assert_redirected_to web_session_path(assigns(:web_session))
  end

  test "should show web_session" do
    get :show, id: @web_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @web_session
    assert_response :success
  end

  test "should update web_session" do
    patch :update, id: @web_session, web_session: {  }
    assert_redirected_to web_session_path(assigns(:web_session))
  end

  test "should destroy web_session" do
    assert_difference('Web::Session.count', -1) do
      delete :destroy, id: @web_session
    end

    assert_redirected_to web_sessions_path
  end
end
