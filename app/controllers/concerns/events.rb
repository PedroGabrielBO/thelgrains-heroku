module Events
  extend ActiveSupport::Concern
  include XhrRequestable

  included do
    before_action :set_event, only: [:show, :edit, :update, :destroy]
    respond_to :json
  end

  # GET /events
  # GET /events.json
  def index
    if params[:user_id]
      @events = Agendamento.where(user_id: params[:user_id])
    else
      @events = Agendamento.all
    end
    render 'events/index'
  end

  # GET /events/1
  # GET /events/1.json
  def show
    render 'events/show'
  end

  # POST /events
  # POST /events.json
  def create
    @event = Agendamento.new(event_params)
    # TODO adicionar outros campos do agendamento

    respond_to do |format|
      if @event.save
        format.json { render :show, status: :created, location: @event }
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.json { render :show, status: :ok, location: @event }
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Agendamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start, :end, :all_day, :user, :cliente, :state)
    end
end
