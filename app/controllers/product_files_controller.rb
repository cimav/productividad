class ProductFilesController < ApplicationController
  before_action :set_product_file, only: [:update_file]


  def ui
    @product = eval("#{params[:product_class]}.find(#{params[:product_id]})")
    @new_file = @product.product_files.new
    render layout: false
  end

  def update_file
    @product_file.notes = params[:notes] 
    @product_file.file_type = params[:file_type]
    
    if @product_file.save
      json = {}
      json[:id] = @product_file.id
      json[:message] = 'Archivo actualizado'
      render :json => json
    else
      flash[:error] = 'No se pudo actualizar el archivo'
      json = {}
      json[:flash] = flash
      json[:errors] = @product_file.errors
      render :json => json, :status => :unprocessable_entity
    end
  end

  def delete_file

  	 @product_file = ProductFile.find(params[:id])
  	 @product_file.status = ProductParticipant::DELETED

    if @product_file.save
      json = {}
      json[:id] = @product_file.id
      render :json => json
    else
      flash[:error] = 'No se pudo eliminar el archivo'
      json = {}
      json[:flash] = flash
      json[:errors] = @product_file.errors
      render :json => json, :status => :unprocessable_entity
    end
  end


  def create
    @product = eval("#{params[:product_file][:product_class]}.find(#{params[:product_file][:product_id]})")

  	@product_file = @product.product_files.new
    @product_file.person_id = current_user.id
    @product_file.notes = params[:notes]
    @product_file.status = ProductFile::ACTIVE
    @product_file.file = params[:product_file][:file]

    if @product_file.save
      json = {}
      json[:id] = @product_file.id
      json[:message] = 'Archivo agregado'
      render :json => json
    else
      flash[:error] = 'No se pudo agregar el archivo'
      json = {}
      json[:flash] = flash
      json[:errors] = @product_file.errors
      render :json => json, :status => :unprocessable_entity
    end
  end

  def download
  	f = ProductFile.find(params[:id])
    send_file f.file.to_s, :disposition => 'inline'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_file
      @product_file = ProductFile.find(params[:id])
    end
end
