require 'bcrypt'
class Web::SessionController < WebBaseController

  skip_before_action :require_login, only: [:new, :create]

  def new
    if session[:id] == 'web'
      redirect_to app_path, notice: 'Você já está logado.'
    end
  end

  def create
    if Rails.application.secrets.web_password == BCrypt::Password.create(params[:password])
      session[:id] = 'web'
      redirect_to app_path, notice: 'Logado com sucesso!'
    else
      redirect_to action: :new, alert: 'Senha incorreta!'
    end
  end

  def destroy
    session[:id] = nil
    redirect_to action: :new, notice: 'Sessão encerrada!'
  end

  private

  def session_params
    params.permit(:password)
  end
end
