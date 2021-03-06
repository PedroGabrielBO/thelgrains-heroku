class ServicosController < ApplicationController
  before_action :set_servico, only: [:show, :edit, :update, :destroy]

  # GET /admin/servicos
  # GET /admin/servicos.json
  def index
    @servicos = Servico.all
  end

  # GET /admin/servicos/1
  # GET /admin/servicos/1.json
  def show
  end

  # POST /admin/servicos
  # POST /admin/servicos.json
  def create
    @servico = Servico.new(servico_params)

    respond_to do |format|
      if @servico.save
        format.html { redirect_to @servico, notice: 'Servico was successfully created.' }
        format.json { render :show, status: :created, location: @servico }
      else
        format.html { render :new }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/servicos/1
  # PATCH/PUT /admin/servicos/1.json
  def update
    respond_to do |format|
      if @servico.update(servico_params)
        format.html { redirect_to @servico, notice: 'Servico was successfully updated.' }
        format.json { render :show, status: :ok, location: @servico }
      else
        format.html { render :edit }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/servicos/1
  # DELETE /admin/servicos/1.json
  def destroy
    @servico.destroy
    respond_to do |format|
      format.html { redirect_to servicos_url, notice: 'Servico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_servico
    @servico = Servico.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def servico_params
    params[:servico]
  end
end
