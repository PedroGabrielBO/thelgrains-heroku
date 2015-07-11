require 'bcrypt'
class Web::SessionController < WebBaseController

  skip_before_action :require_login, only: [:new, :create]

  def new
  if session[:id] == 'web' then redirect_to 'app#index' end
  end

  def create
    if Rails.application.secrets.web_password == BCrypt::Password.create(params[:password])
      session[:id] = 'web'
      flash.now[:notice] = 'Logado com sucesso!'
      redirect_to '/app'
    else
      flash.now[:alert] = 'Senha incorreta!'
      redirect_to action: :new
    end
  end

  def destroy
    session[:id] = nil
    flash.now[:notice] = 'Sessão encerrada!'
    redirect_to action: :new
  end

  private

  def user_params
    params.permit(:password)
  end
end
