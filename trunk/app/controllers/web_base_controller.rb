class WebBaseController < ApplicationController
  respond_to :html
  before_action :require_login

  private

  def require_login
    unless logged_in?
      flash[:error] = 'Você deve estar logado para acessar a página!'
      redirect_to login_path # halts request cycle
    end
  end

  def logged_in?
    session[:id] == 'web'
  end

end
