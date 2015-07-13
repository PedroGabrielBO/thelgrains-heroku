class WebComentario < ActiveRecord::Base
  validates_presence_of :nome, :email, :comentario
  validates :comentario, length: { minimum: 5, maximum: 500 }
  validate :limite_de_comentario

  private

  def limite_de_comentario
    # TODO query de verificação de limite de WebComentarios (parametros de configuração)
    n = 2 # quantidade limite de comentarios (exclusive)
    t = 10 # tempo em minutos (exclusive)
    query = WebComentario.where([ "updated_at > ? AND email == ?", t.minutes.ago, email ])
    puts(query.size)
    if query.size > n
      query.each { |a| a.touch }
      errors.add(:limite_de_comentario, "Aguarde #{t} minutos para comentar!")
    end
  end

end
