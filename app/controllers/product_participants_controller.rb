class ProductParticipantsController < ApplicationController
  before_action :set_product_participant, only: [:update_participant, :delete_participant]


  def ui
    @product = eval("#{params[:product_class]}.find(#{params[:product_id]})")
    render layout: false
  end

  def participant_select
    @type_id = params[:type_id]
    @participant_id = params[:participant_id]
    render layout: false
  end

  def update_participant
    @product_participant.person_id = params[:person_id] 
    if !params[:person_id].blank?
      @product_participant.participant_type = ProductParticipant::IS_ORG
    else
      @product_participant.participant_type = ProductParticipant::IS_EXTERNAL
    end
    @product_participant.participation = params[:participation] if !params[:participation].blank?
    @product_participant.status = ProductParticipant::ACTIVE 
    if @product_participant.save
      json = {}
      json[:id] = @product_participant.id
      json[:message] = 'Participante actualizado'
      render :json => json
    else
      flash[:error] = 'No se pudo actualizar el participante'
      json = {}
      json[:flash] = flash
      json[:errors] = @product_participant.errors
      render :json => json, :status => :unprocessable_entity
    end
  end

  def delete_participant

  	if !@product_participant.author_is.blank? 
      authors_array = @product_participant.attachable.authors.split(',')
      author_found = false
      authors_array.each do |author| 
        author_sanitized = author.remove('and').strip
        if @product_participant.author_is == author_sanitized
          author_found = true
          break
        end
      end
      if author_found       
        @product_participant.status = ProductParticipant::UNASSIGNED
      else
        @product_participant.status = ProductParticipant::DELETED
      end 
    else
  	  @product_participant.status = ProductParticipant::DELETED
  	end

    if @product_participant.save
      json = {}
      json[:id] = @product_participant.id
      render :json => json
    else
      flash[:error] = 'No se pudo eliminar el participante'
      json = {}
      json[:flash] = flash
      json[:errors] = @product_participant.errors
      render :json => json, :status => :unprocessable_entity
    end
  end


  def add_participant
    @product = eval("#{params[:product_class]}.find(#{params[:product_id]})")

  	@product_participant = @product.product_participants.new

    if !params[:person_id].blank?
      @product_participant.participant_type = ProductParticipant::IS_ORG
      @product_participant.person_id = params[:person_id]
    else
      @product_participant.participant_type = ProductParticipant::IS_EXTERNAL
      @product_participant.author_is = params[:author_is]
    end
  	
    @product_participant.participation = params[:participation]
    @product_participant.status = ProductParticipant::ACTIVE
    if @product_participant.save
      json = {}
      json[:id] = @product_participant.id
      json[:message] = 'Participante agregado'
      render :json => json
    else
      flash[:error] = 'No se pudo agregar el participante'
      json = {}
      json[:flash] = flash
      json[:errors] = @product_participant.errors
      render :json => json, :status => :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_participant
      @product_participant = ProductParticipant.find(params[:id])
    end
end
