class Admin::ClientesController < ApplicationController
  before_action :set_admin_cliente, only: [:show, :edit, :update, :destroy]

  # GET /admin/clientes
  # GET /admin/clientes.json
  def index
    @admin_clientes = Admin::Cliente.all
  end

  # GET /admin/clientes/1
  # GET /admin/clientes/1.json
  def show
  end

  # GET /admin/clientes/new
  def new
    @admin_cliente = Admin::Cliente.new
  end

  # GET /admin/clientes/1/edit
  def edit
  end

  # POST /admin/clientes
  # POST /admin/clientes.json
  def create
    @admin_cliente = Admin::Cliente.new(admin_cliente_params)

    respond_to do |format|
      if @admin_cliente.save
        format.html { redirect_to @admin_cliente, notice: 'Cliente was successfully created.' }
        format.json { render :show, status: :created, location: @admin_cliente }
      else
        format.html { render :new }
        format.json { render json: @admin_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/clientes/1
  # PATCH/PUT /admin/clientes/1.json
  def update
    respond_to do |format|
      if @admin_cliente.update(admin_cliente_params)
        format.html { redirect_to @admin_cliente, notice: 'Cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_cliente }
      else
        format.html { render :edit }
        format.json { render json: @admin_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/clientes/1
  # DELETE /admin/clientes/1.json
  def destroy
    @admin_cliente.destroy
    respond_to do |format|
      format.html { redirect_to admin_clientes_url, notice: 'Cliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_cliente
      @admin_cliente = Admin::Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_cliente_params
      params[:admin_cliente]
    end
end
