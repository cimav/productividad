class ProductCitesController < ApplicationController
  before_action :set_product_cite, only: [:edit_cite, :update_cite, :delete_cite]


  def ui
    year = params[:year]

    if year.blank? 
      year = Time.current.year
    end

    @filter_year = year

    @product = eval("#{params[:product_class]}.find(#{params[:product_id]})")

    @all_product_cites = @product.product_cites.where(status: ProductCite::ACTIVE)
    @product_cites = @all_product_cites

    if year != 'todos'
      @product_cites = @product_cites.where("YEAR(published_date) = ?", year)
    end

    @product_cites = @product_cites .order(published_date: :desc)

    min_date = @all_product_cites.minimum(:published_date)
    
    @min_year = min_date.year rescue year

    render layout: false
  end

  def new
    @product = eval("#{params[:product_class]}.find(#{params[:product_id]})")
    @cite = @product.product_cites.new
    render layout: false
  end

  def edit_cite
    render layout: false
  end

  def update_cite
    @product_cite.title = params[:title]
    @product_cite.published_date = params[:published_date]
    @product_cite.authors = params[:authors]
    @product_cite.journal_id = params[:journal_id]
    @product_cite.volume = params[:volume]
    @product_cite.issue = params[:issue]
    @product_cite.pages = params[:pages]
    @product_cite.doi = params[:doi]  
    @product_cite.status = ProductCite::ACTIVE 
    if @product_cite.save
      json = {}
      json[:id] = @product_cite.id
      json[:message] = 'Cita actualizada'
      render :json => json
    else
      flash[:error] = 'No se pudo actualizar la cita'
      json = {}
      json[:flash] = flash
      json[:errors] = @product_cite.errors
      render :json => json, :status => :unprocessable_entity
    end
  end

  def delete_cite
    @product_cite.status = ProductCite::DELETED

    if @product_cite.save
      json = {}
      json[:id] = @product_cite.id
      render :json => json
    else
      flash[:error] = 'No se pudo eliminar la cita'
      json = {}
      json[:flash] = flash
      json[:errors] = @product_cite.errors
      render :json => json, :status => :unprocessable_entity
    end
  end


  def add_cite
    @product = eval("#{params[:product_class]}.find(#{params[:product_id]})")

  	@product_cite = @product.product_cites.new
    @product_cite.title = params[:title]
    @product_cite.published_date = params[:published_date]
    @product_cite.authors = params[:authors]
    @product_cite.journal_id = params[:journal_id]
    @product_cite.volume = params[:volume]
    @product_cite.issue = params[:issue]
    @product_cite.pages = params[:pages]
    @product_cite.doi = params[:doi]  
    @product_cite.status = ProductCite::ACTIVE

    if @product_cite.save
      json = {}
      json[:id] = @product_cite.id
      json[:message] = 'Cita agregada'
      render :json => json
    else
      flash[:error] = 'No se pudo agregar la cita'
      json = {}
      json[:flash] = flash
      json[:errors] = @product_cite.errors
      render :json => json, :status => :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_cite
      @product_cite = ProductCite.find(params[:id])
    end

    def product_cite_params
      params.require(:product_cite).permit(:title, :published_date, :journal_id, :authors, :volume, :issue, :pages, :doi, :person_id, :status)
    end
end
