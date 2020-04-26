class SimpleCrudController < ApplicationController

  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def initialize
  	@crud_title = 'Sin Título'
  	@crud_model ||= controller_path.classify.constantize
  	@crud_limit = 15
  	@crud_layout = 'application'
  	@crud_fields = []
    @crud_filters = []
  	self.add_field(:id, "ID", :integer, {hide: true})
  end

  def add_field (field, text, type, params = {})
  	@crud_fields << {field: field, text: text, type: type, params: params}
  end 

  def add_filter(type, fields, params = {})
    @crud_filters << {type: type, fields: fields, params: params}
  end
  	
  def crud_attrs 
  	c = []
  	@crud_fields.each do |f| 
  	  c << :"#{f[:field]}"
  	end
  	c 
  end

  def index
    @entries = @crud_model.select(crud_attrs).all
    
    if !params[:page].blank?
      @page = params[:page].to_i
    else 
      @page = 1
    end
    if params[:search] == 'true'
      i = 0
      @crud_filters.each do |filter|
        i = i + 1
        
        if filter[:type] == :search && !params["f#{i}"].blank?
          where_text = ""
          sfc = 0
          filter[:fields].each do |f|
            sfc = sfc + 1
            if sfc > 1
              where_text += " OR "
            end
            where_text += "#{f} LIKE :query"
          end 
          query = params["f#{i}"]
          @entries = @entries.where(where_text, query: "%#{query}%")
        end

        if filter[:type] == :select && !params["f#{i}"].blank?
          where_text = ""
          sfc = 0
          filter[:fields].each do |f|
            sfc = sfc + 1
            if sfc > 1
              where_text += " AND "
            end
            where_text += "#{f} = :value"
          end 
          value = params["f#{i}"]
          @entries = @entries.where(where_text, value: value)
        end

      end 
      @count_all = @entries.count(:all)
      @entries = @entries.limit(@crud_limit).offset( (@page - 1) * @crud_limit )
      render layout: false
    else 
      @count_all = @entries.count(:all)
      @entries = @entries.limit(@crud_limit).offset(  (@page - 1) * @crud_limit )
      render layout: @crud_layout
    end 
  end

  def show
  	render layout: @crud_layout
  end

  def new
  	@entry = @crud_model.new
  	@crud_fields.each do |f|
  	  if !f[:params][:default].blank?
  	  	@entry[f[:field]] = f[:params][:default]
  	  end
    end
    render layout: @crud_layout
  end

  def edit 
  	render layout: @crud_layout
  end

  def create
  	@entry = @crud_model.new(entry_params)
  	if @entry.save 
  	  redirect_to @entry
  	end
  end

  def update
  	@entry.update(entry_params)
  	redirect_to @entry
  end

  def destroy
  	@entry.destroy
  	redirect_to polymorphic_path(@crud_model)
  end

  private 
  def set_entry
  	@entry = @crud_model.find(params[:id])
  end

  def entry_params
  	model_identifier = @crud_model.model_name.param_key
  	params.require(model_identifier).permit(crud_attrs)
  end

end
