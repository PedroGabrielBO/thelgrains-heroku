
class Admin::SessionController < AdminBaseController
  skip_before_action :require_login, only: [:new, :create]

  def new
    # if session[:id] == 'web' then redirect_to 'app#index' end
  end

  def create
    user = User.find_by_cpf(params[:cpf])

    if user && user.authenticate(params[:password])
      session[:back_to_app] = 'true' if session[:id] == 'web'
      session[:id] = user.id
      flash.now[:notice] = 'Logado na Administração com sucesso!'
      redirect_to admin_app_path
    else
      flash.now[:alert] = 'Senha incorreta!'
      redirect_to action: :new
    end
  end

  def destroy
    flash.now[:notice] = 'Sessão administrativa encerrada!'
    if back_to_app?
      session[:id] = 'web'
      session.delete :back_to_app
      redirect_to app_path
    else
      session[:id] = nil
      redirect_to admin_login_path
    end
  end

  private

  def user_params
    params.permit(:password)
  end
end
