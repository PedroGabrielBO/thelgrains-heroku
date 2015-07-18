module Webable
  extend ActiveSupport::Concern

  included do
    respond_to :html
    before_action :require_login
  end

  def require_login
    unless logged_in?
      flash[:error] = 'Você deve estar logado para acessar a página!'
      respond_to do |format|
        format.html { redirect_to login_path } # halts request cycle
        format.json { render json: flash , status: :unauthorized }
      end
    end
  end

  def logged_in?
    session[:id] == 'web'
  end

  # TODO
  def prevent_double_login
    # session[:id] == nil ? session[:id] = nil : true
  end


end
