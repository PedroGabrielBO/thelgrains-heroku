class Admin::FuncionariosController < ApplicationController
  before_action :set_admin_funcionario, only: [:show, :edit, :update, :destroy]

  # GET /admin/funcionarios
  # GET /admin/funcionarios.json
  def index
    @admin_funcionarios = Admin::Funcionario.all
  end

  # GET /admin/funcionarios/1
  # GET /admin/funcionarios/1.json
  def show
  end

  # GET /admin/funcionarios/new
  def new
    @admin_funcionario = Admin::Funcionario.new
  end

  # GET /admin/funcionarios/1/edit
  def edit
  end

  # POST /admin/funcionarios
  # POST /admin/funcionarios.json
  def create
    @admin_funcionario = Admin::Funcionario.new(admin_funcionario_params)

    respond_to do |format|
      if @admin_funcionario.save
        format.html { redirect_to @admin_funcionario, notice: 'Funcionario was successfully created.' }
        format.json { render :show, status: :created, location: @admin_funcionario }
      else
        format.html { render :new }
        format.json { render json: @admin_funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/funcionarios/1
  # PATCH/PUT /admin/funcionarios/1.json
  def update
    respond_to do |format|
      if @admin_funcionario.update(admin_funcionario_params)
        format.html { redirect_to @admin_funcionario, notice: 'Funcionario was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_funcionario }
      else
        format.html { render :edit }
        format.json { render json: @admin_funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/funcionarios/1
  # DELETE /admin/funcionarios/1.json
  def destroy
    @admin_funcionario.destroy
    respond_to do |format|
      format.html { redirect_to admin_funcionarios_url, notice: 'Funcionario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_funcionario
      @admin_funcionario = Admin::Funcionario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_funcionario_params
      params[:admin_funcionario]
    end
end
