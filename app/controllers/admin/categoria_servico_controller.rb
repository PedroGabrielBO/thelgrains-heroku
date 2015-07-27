module Admin
  class CategoriaServicoController < ApplicationController

  def index
    @categorias = CategoriaServico.all
  end

  # GET /admin/categorias/1
  # GET /admin/categorias/1.json
  def show
  end

  # POST /admin/categorias
  # POST /admin/categorias.json
  def create
    @categoria = CategoriaServico.new(categoria_params)

    respond_to do |format|
      if @categoria.save
        format.html { redirect_to @categoria, notice: 'Servico was successfully created.' }
        format.json { render :show, status: :created, location: @categoria }
      else
        format.html { render :new }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/categorias/1
  # PATCH/PUT /admin/categorias/1.json
  def update
    respond_to do |format|
      if @categoria.update(categoria_params)
        format.html { redirect_to @categoria, notice: 'Servico was successfully updated.' }
        format.json { render :show, status: :ok, location: @categoria }
      else
        format.html { render :edit }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/servicos/1
  # DELETE /admin/servicos/1.json
  def destroy
    @categoria.destroy
    respond_to do |format|
      format.html { redirect_to categoria_url, notice: 'Categoria was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_categoria
    @categoria = CategoriaServico.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def categoria_params
    params[:categoria]
  end
end
