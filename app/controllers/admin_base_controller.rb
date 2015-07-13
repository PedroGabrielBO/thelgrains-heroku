class AdminBaseController < ApplicationController
  respond_to :html, :json
  before_action :require_login

  private

  def require_login
    unless logged_in?
      flash.now[:error] = 'Faça login para acessar a página!'
      redirect_to admin_login_path # halts request cycle
    end
  end

  def logged_in?
    session[:id] == 'admin'
  end

  def back_to_app?
    session[:back_to_app] == 'true'
  end
end
