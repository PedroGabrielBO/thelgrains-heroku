require 'bcrypt'
class Web::SessionController < WebBaseController

  skip_before_action :require_login, only: [:new, :create]

  def new
    redirect_to app_path if session[:id] == 'web'
  end

  def create
    # SEMPRE USE BCrypt
    if BCrypt::Password.new(Rails.application.secrets.web_password.to_s) == params[:password]
      session[:id] = 'web'
      redirect_to app_path, notice: 'Logado com sucesso!'
    else
      redirect_to login_path, alert: 'Senha incorreta!'
    end
  end

  def destroy
    session[:id] = nil
    redirect_to login_path, notice: 'Sessão encerrada!'
  end

  private

  def user_params
    params.permit(:password)
  end
end
