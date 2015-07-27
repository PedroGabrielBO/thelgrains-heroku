class Admin::AgendamentosController < ApplicationController
  before_action :set_admin_agendamento, only: [:show, :edit, :update, :destroy]

  # GET /admin/agendamentos
  # GET /admin/agendamentos.json
  def index
    @admin_agendamentos = Admin::Agendamento.all
  end

  # GET /admin/agendamentos/1
  # GET /admin/agendamentos/1.json
  def show
  end

  # GET /admin/agendamentos/new
  def new
    @admin_agendamento = Admin::Agendamento.new
  end

  # GET /admin/agendamentos/1/edit
  def edit
  end

  # POST /admin/agendamentos
  # POST /admin/agendamentos.json
  def create
    @admin_agendamento = Admin::Agendamento.new(admin_agendamento_params)

    respond_to do |format|
      if @admin_agendamento.save
        format.html { redirect_to @admin_agendamento, notice: 'Agendamento was successfully created.' }
        format.json { render :show, status: :created, location: @admin_agendamento }
      else
        format.html { render :new }
        format.json { render json: @admin_agendamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/agendamentos/1
  # PATCH/PUT /admin/agendamentos/1.json
  def update
    respond_to do |format|
      if @admin_agendamento.update(admin_agendamento_params)
        format.html { redirect_to @admin_agendamento, notice: 'Agendamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_agendamento }
      else
        format.html { render :edit }
        format.json { render json: @admin_agendamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/agendamentos/1
  # DELETE /admin/agendamentos/1.json
  def destroy
    @admin_agendamento.destroy
    respond_to do |format|
      format.html { redirect_to admin_agendamentos_url, notice: 'Agendamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_agendamento
      @admin_agendamento = Admin::Agendamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_agendamento_params
      params[:admin_agendamento]
    end
end
