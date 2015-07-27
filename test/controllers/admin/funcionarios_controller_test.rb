require 'test_helper'

class Admin::FuncionariosControllerTest < ActionController::TestCase
  setup do
    @admin_funcionario = admin_funcionarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_funcionarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_funcionario" do
    assert_difference('Admin::Funcionario.count') do
      post :create, admin_funcionario: {  }
    end

    assert_redirected_to admin_funcionario_path(assigns(:admin_funcionario))
  end

  test "should show admin_funcionario" do
    get :show, id: @admin_funcionario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_funcionario
    assert_response :success
  end

  test "should update admin_funcionario" do
    patch :update, id: @admin_funcionario, admin_funcionario: {  }
    assert_redirected_to admin_funcionario_path(assigns(:admin_funcionario))
  end

  test "should destroy admin_funcionario" do
    assert_difference('Admin::Funcionario.count', -1) do
      delete :destroy, id: @admin_funcionario
    end

    assert_redirected_to admin_funcionarios_path
  end
end
