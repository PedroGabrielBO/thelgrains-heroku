require 'test_helper'

class Admin::ServicosControllerTest < ActionController::TestCase
  setup do
    @admin_servico = admin_servicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_servicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_servico" do
    assert_difference('Admin::Servico.count') do
      post :create, admin_servico: {  }
    end

    assert_redirected_to admin_servico_path(assigns(:admin_servico))
  end

  test "should show admin_servico" do
    get :show, id: @admin_servico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_servico
    assert_response :success
  end

  test "should update admin_servico" do
    patch :update, id: @admin_servico, admin_servico: {  }
    assert_redirected_to admin_servico_path(assigns(:admin_servico))
  end

  test "should destroy admin_servico" do
    assert_difference('Admin::Servico.count', -1) do
      delete :destroy, id: @admin_servico
    end

    assert_redirected_to admin_servicos_path
  end
end
