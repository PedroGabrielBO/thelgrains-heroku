require 'test_helper'

class Admin::AgendamentosControllerTest < ActionController::TestCase
  setup do
    @admin_agendamento = admin_agendamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_agendamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_agendamento" do
    assert_difference('Admin::Agendamento.count') do
      post :create, admin_agendamento: {  }
    end

    assert_redirected_to admin_agendamento_path(assigns(:admin_agendamento))
  end

  test "should show admin_agendamento" do
    get :show, id: @admin_agendamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_agendamento
    assert_response :success
  end

  test "should update admin_agendamento" do
    patch :update, id: @admin_agendamento, admin_agendamento: {  }
    assert_redirected_to admin_agendamento_path(assigns(:admin_agendamento))
  end

  test "should destroy admin_agendamento" do
    assert_difference('Admin::Agendamento.count', -1) do
      delete :destroy, id: @admin_agendamento
    end

    assert_redirected_to admin_agendamentos_path
  end
end
