class Admin::AtendimentosController < ApplicationController
  before_action :set_admin_atendimento, only: [:show, :edit, :update, :destroy]

  # GET /admin/atendimentos
  # GET /admin/atendimentos.json
  def index
    @admin_atendimentos = Admin::Atendimento.all
  end

  # GET /admin/atendimentos/1
  # GET /admin/atendimentos/1.json
  def show
  end

  # GET /admin/atendimentos/new
  def new
    @admin_atendimento = Admin::Atendimento.new
  end

  # GET /admin/atendimentos/1/edit
  def edit
  end

  # POST /admin/atendimentos
  # POST /admin/atendimentos.json
  def create
    @admin_atendimento = Admin::Atendimento.new(admin_atendimento_params)

    respond_to do |format|
      if @admin_atendimento.save
        format.html { redirect_to @admin_atendimento, notice: 'Atendimento was successfully created.' }
        format.json { render :show, status: :created, location: @admin_atendimento }
      else
        format.html { render :new }
        format.json { render json: @admin_atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/atendimentos/1
  # PATCH/PUT /admin/atendimentos/1.json
  def update
    respond_to do |format|
      if @admin_atendimento.update(admin_atendimento_params)
        format.html { redirect_to @admin_atendimento, notice: 'Atendimento was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_atendimento }
      else
        format.html { render :edit }
        format.json { render json: @admin_atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/atendimentos/1
  # DELETE /admin/atendimentos/1.json
  def destroy
    @admin_atendimento.destroy
    respond_to do |format|
      format.html { redirect_to admin_atendimentos_url, notice: 'Atendimento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_atendimento
      @admin_atendimento = Admin::Atendimento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_atendimento_params
      params[:admin_atendimento]
    end
end
