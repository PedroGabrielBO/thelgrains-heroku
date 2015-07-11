class Android::SessionController < AndroidBaseController
  respond_to :json

  def new

  end

  def create
    user = User.find_by_cpf(params[:cpf])

    if user && user.authenticate(params[:password])
      session[:id] = user.id
      resp = {
        user: user.funcionario,
        message: 'Usuário autenticado!'
      }
      render json: resp, status: :ok
    else
      resp = {
        user: nil,
        message: 'Usuário não autenticado!'
      }
      render json: resp, status: :unauthorized
    end
  end

  def destroy
    session[:id] = nil
    render :ok
  end

  private

  def user_params
    params.require(:user).permit(:cpf, :password)
  end

  def current_user
    @current_user ||= session[:id] && User.find_by(id: session[:id])
  end
end
