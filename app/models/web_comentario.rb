class WebComentario < ActiveRecord::Base
  validates_presence_of :nome, :email, :comentario
  validates :comentario, length: { minimum: 5, maximum: 500 }
  validate :limite_de_comentario

  private

  def limite_de_comentario
    # TODO, query de verificacao de limite de WebComentarios (parametros de configuracao)
    n = Rails.configuration.comentarios.limite_n # quantidade limite de comentarios (exclusive)
    t = Rails.configuration.comentarios.tempo_min # tempo em minutos (exclusive)
    query = WebComentario.where('updated_at > ? AND email = ?', t.minutes.ago, email) # :updated_at > t.minutes.ago, email: email
    puts(query.size)
    return true if query.size < n
    query.each(&:touch) # chama touch para cada objeto na query
    errors.add(:limite_de_comentario, "Aguarde #{t} minutos para comentar!")
  end

end
