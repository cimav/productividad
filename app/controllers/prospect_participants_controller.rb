class ProspectParticipantsController < ApplicationController
  before_action :auth_required

  before_action :set_prospect
  before_action :set_prospect_participant, only: [:show, :edit, :update, :destroy]
  before_action :set_person

  def index
    render :layout => false
  end

  def show
  	if @prospect_participant.status == ProspectParticipant::DELETED
  	  redirect_to prospect_prospect_participants_path(@person.shortname, @prospect)
  	else
      render :layout => 'profile'
    end
  end

  def new
    @prospect_participant = ProspectParticipant.new
    render :layout => 'profile'
  end

  def edit
    render :layout => 'profile'
  end

  def create
  	@prospect_participant = @prospect.prospect_participants.build(prospect_participant_params)
    @prospect_participant.status = ProspectParticipant::ACTIVE
    @prospect_participant.suggested_by = current_user.id

    if @prospect_participant.save
      json = {}
      json[:prospect_id] = @prospect_participant.prospect.id
      render :json => json
    else
      flash[:error] = 'No se pudo agregar participante'
      json = {}
      json[:flash] = flash
      json[:errors] = @prospect_participant.errors
      render :json => json, :status => :unprocessable_entity
    end

  end

  def update
    respond_to do |format|

      if @prospect_participant.update(prospect_participant_params)
        changes = @prospect.changes
        @prospect.last_date = @prospect.start_date
      
        @prospect.save

        log = @prospect.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "El participante ha sido actualizado."
        log.save
          
        format.html { redirect_to prospect_prospect_participants_path(@person.shortname, @prospect), notice: 'El participante ha sido actualizado' }
        format.json { render :show, status: :ok, location: @prospect }
      else
        format.html { render :edit }
        format.json { render json: @prospect.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @prospect_participant.status = ProspectParticipant::DELETED
    @prospect_participant.save
    respond_to do |format|
      format.html { redirect_to prospect_prospect_participants_path(@person.shortname, @prospect), notice: 'El participante ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_prospect
      @prospect = Prospect.find(params[:prospect_id])
    end

    def set_prospect_participant
      @prospect_participant = ProspectParticipant.find(params[:id])
    end

    def prospect_participant_params
      params.require(:prospect_participant).permit(:prospect_id, :person_id, :suggested_by, :suggester_comments, :suggested_comments, :participant_type, :status)
    end
end
