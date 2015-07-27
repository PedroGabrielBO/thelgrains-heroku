require 'test_helper'

class Admin::ClientesControllerTest < ActionController::TestCase
  setup do
    @admin_cliente = admin_clientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_cliente" do
    assert_difference('Admin::Cliente.count') do
      post :create, admin_cliente: {  }
    end

    assert_redirected_to admin_cliente_path(assigns(:admin_cliente))
  end

  test "should show admin_cliente" do
    get :show, id: @admin_cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_cliente
    assert_response :success
  end

  test "should update admin_cliente" do
    patch :update, id: @admin_cliente, admin_cliente: {  }
    assert_redirected_to admin_cliente_path(assigns(:admin_cliente))
  end

  test "should destroy admin_cliente" do
    assert_difference('Admin::Cliente.count', -1) do
      delete :destroy, id: @admin_cliente
    end

    assert_redirected_to admin_clientes_path
  end
end
