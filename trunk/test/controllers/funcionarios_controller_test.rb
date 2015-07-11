require 'test_helper'

class FuncionariosControllerTest < ActionController::TestCase
  setup do
    @funcionario = funcionarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funcionarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funcionario" do
    assert_difference('Funcionario.count') do
      post :create, funcionario: { celular_1: @funcionario.celular_1, celular_2: @funcionario.celular_2, cep: @funcionario.cep, cpf: @funcionario.cpf, email: @funcionario.email, endereco: @funcionario.endereco, endereco_complemento: @funcionario.endereco_complemento, endereco_numero: @funcionario.endereco_numero, nome: @funcionario.nome, password_digest: @funcionario.password_digest, telefone_fixo: @funcionario.telefone_fixo, telefone_ramal: @funcionario.telefone_ramal }
    end

    assert_redirected_to funcionario_path(assigns(:funcionario))
  end

  test "should show funcionario" do
    get :show, id: @funcionario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funcionario
    assert_response :success
  end

  test "should update funcionario" do
    patch :update, id: @funcionario, funcionario: { celular_1: @funcionario.celular_1, celular_2: @funcionario.celular_2, cep: @funcionario.cep, cpf: @funcionario.cpf, email: @funcionario.email, endereco: @funcionario.endereco, endereco_complemento: @funcionario.endereco_complemento, endereco_numero: @funcionario.endereco_numero, nome: @funcionario.nome, password_digest: @funcionario.password_digest, telefone_fixo: @funcionario.telefone_fixo, telefone_ramal: @funcionario.telefone_ramal }
    assert_redirected_to funcionario_path(assigns(:funcionario))
  end

  test "should destroy funcionario" do
    assert_difference('Funcionario.count', -1) do
      delete :destroy, id: @funcionario
    end

    assert_redirected_to funcionarios_path
  end
end
