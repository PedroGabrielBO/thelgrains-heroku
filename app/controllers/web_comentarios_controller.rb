class WebComentariosController < ApplicationController
  include XhrRequestable
  after_filter { flash.discard if request.xhr? }

  def create
    @web_comentario = WebComentario.new(web_comentario_params) if request.xhr?
    if @web_comentario
      respond_to do |format|
        if @web_comentario.save
          format.js { head :created }
        else
          if @web_comentario.errors[:limite_de_comentario]
            format.js { head :locked }
          else
            format.js { head status: 400 }
          end
        end
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def web_comentario_params
    params.require(:web_comentario).permit(:nome, :email, :comentario)
  end
end
