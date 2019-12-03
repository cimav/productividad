class AcknowledgmentsController < ApplicationController
  before_action :set_acknowledgment, only: [:update_acknowledgment, :delete_acknowledgment]

  def ui
    @product = eval("#{params[:product_class]}.find(#{params[:product_id]})")
    render layout: false
  end

  def person_select
    @type_id = params[:type_id]
    render layout: false
  end

  def delete_acknowledgment
  	@acknowledgment.status = Acknowledgment::DELETED

    if @acknowledgment.save
      json = {}
      json[:id] = @acknowledgment.id
      render :json => json
    else
      flash[:error] = 'No se pudo eliminar el agradecimiento'
      json = {}
      json[:flash] = flash
      json[:errors] = @acknowledgment.errors
      render :json => json, :status => :unprocessable_entity
    end
  end


  def add_acknowledgment
    @product = eval("#{params[:product_class]}.find(#{params[:product_id]})")
  	@acknowledgment = @product.acknowledgments.new

    @acknowledgment.person_id = params[:person_id]	
    @acknowledgment.notes = params[:notes]
    @acknowledgment.status = Acknowledgment::ACTIVE
    if @acknowledgment.save
      json = {}
      json[:id] = @acknowledgment.id
      json[:message] = 'Participante agregado'
      render :json => json
    else
      flash[:error] = 'No se pudo agregar el agradecimiento'
      json = {}
      json[:flash] = flash
      json[:errors] = @acknowledgment.errors
      render :json => json, :status => :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acknowledgment
      @acknowledgment = Acknowledgment.find(params[:id])
    end
end
