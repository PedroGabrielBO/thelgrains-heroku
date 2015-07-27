require 'test_helper'

class Admin::AtendimentosControllerTest < ActionController::TestCase
  setup do
    @admin_atendimento = admin_atendimentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_atendimentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_atendimento" do
    assert_difference('Admin::Atendimento.count') do
      post :create, admin_atendimento: {  }
    end

    assert_redirected_to admin_atendimento_path(assigns(:admin_atendimento))
  end

  test "should show admin_atendimento" do
    get :show, id: @admin_atendimento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_atendimento
    assert_response :success
  end

  test "should update admin_atendimento" do
    patch :update, id: @admin_atendimento, admin_atendimento: {  }
    assert_redirected_to admin_atendimento_path(assigns(:admin_atendimento))
  end

  test "should destroy admin_atendimento" do
    assert_difference('Admin::Atendimento.count', -1) do
      delete :destroy, id: @admin_atendimento
    end

    assert_redirected_to admin_atendimentos_path
  end
end
