class WebComentariosController < ApplicationController
  before_action :set_web_comentario, only: [:show, :edit, :update, :destroy]

  # GET /web_comentarios
  # GET /web_comentarios.json
  def index
    @web_comentarios = WebComentario.all
  end

  # GET /web_comentarios/1
  # GET /web_comentarios/1.json
  def show
  end

  # GET /web_comentarios/new
  def new
    @web_comentario = WebComentario.new
  end

  # GET /web_comentarios/1/edit
  def edit
  end

  # POST /web_comentarios
  # POST /web_comentarios.json
  def create
    @web_comentario = WebComentario.new(web_comentario_params)

    respond_to do |format|
      if @web_comentario.save
        format.html { redirect_to @web_comentario, notice: 'Web comentario was successfully created.' }
        format.json { render :show, status: :created, location: @web_comentario }
      else
        format.html { render :new }
        format.json { render json: @web_comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_comentarios/1
  # PATCH/PUT /web_comentarios/1.json
  def update
    respond_to do |format|
      if @web_comentario.update(web_comentario_params)
        format.html { redirect_to @web_comentario, notice: 'Web comentario was successfully updated.' }
        format.json { render :show, status: :ok, location: @web_comentario }
      else
        format.html { render :edit }
        format.json { render json: @web_comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_comentarios/1
  # DELETE /web_comentarios/1.json
  def destroy
    @web_comentario.destroy
    respond_to do |format|
      format.html { redirect_to web_comentarios_url, notice: 'Web comentario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_comentario
      @web_comentario = WebComentario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_comentario_params
      params[:web_comentario]
    end
end
