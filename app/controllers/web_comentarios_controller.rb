class WebComentariosController < ApplicationController
  skip_before_filter :verify_authenticity_token
  after_filter { flash.discard if request.xhr? }

  def create
    @web_comentario = WebComentario.new(web_comentario_params) if request.xhr?
    if @web_comentario
      respond_to do |format|
        if @web_comentario.save
          format.js { head :created }
        else
          format.js { if @web_comentario.errors[:limite_de_comentario]
                        head :locked
                      else head status: 400 end }
        end
      end
    else
      # bloqueio?
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
  def web_comentario_params
    params.require(:web_comentario).permit(:nome, :email, :comentario)
  end
end
