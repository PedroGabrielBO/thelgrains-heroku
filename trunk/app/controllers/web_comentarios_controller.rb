class WebComentariosController < ApplicationController
  skip_before_filter :verify_authenticity_token
  after_filter { flash.discard if request.xhr? }

  def create
    @web_comentario = WebComentario.new(web_comentario_params)

    respond_to do |format|
      if @web_comentario.save
        format.js { flash[:notice] = 'Comentário enviado com sucesso! Obrigado!' }
      else
        format.js { flash[:notice] = @web_comentario.errors.messages }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def web_comentario_params
      params.require(:web_comentario).permit(:nome, :email, :comentario)
    end
end
