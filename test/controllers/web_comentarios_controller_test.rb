require 'test_helper'

class WebComentariosControllerTest < ActionController::TestCase
  setup do
    @web_comentario = web_comentarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:web_comentarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create web_comentario" do
    assert_difference('WebComentario.count') do
      post :create, web_comentario: {  }
    end

    assert_redirected_to web_comentario_path(assigns(:web_comentario))
  end

  test "should show web_comentario" do
    get :show, id: @web_comentario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @web_comentario
    assert_response :success
  end

  test "should update web_comentario" do
    patch :update, id: @web_comentario, web_comentario: {  }
    assert_redirected_to web_comentario_path(assigns(:web_comentario))
  end

  test "should destroy web_comentario" do
    assert_difference('WebComentario.count', -1) do
      delete :destroy, id: @web_comentario
    end

    assert_redirected_to web_comentarios_path
  end
end
