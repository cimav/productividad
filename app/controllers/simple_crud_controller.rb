class SimpleCrudController < ApplicationController
  before_action :set_parent 
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def initialize
  	@crud_title = 'Sin Título'
    @crud_container = ''
    @crud_item_title = nil
    @crud_parent = nil
    @crud_item_image = nil
  	@crud_model ||= controller_path.classify.constantize
  	@crud_limit = 15
  	@crud_layout = 'application'
  	@crud_fields = []
    @crud_filters = []
    @crud_children = []
  	self.add_field(:id, "ID", :integer, {hide: true})

  end

  def add_field (field, text, type, params = {})
  	@crud_fields << {field: field, text: text, type: type, params: params}
  end 

  def add_filter(type, fields, params = {})
    @crud_filters << {type: type, fields: fields, params: params}
  end

  def add_child(child, text)
    @crud_children << {child: child, text: text}
  end 
  	
  def crud_attrs 
  	c = []
  	@crud_fields.each do |f| 
      next if f[:type] == :show
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
    if @parent
      @entry = @crud_model.new(entry_params)
      @entry[:"#{@crud_parent}_id"] = @parent.id
    else  
  	  @entry = @crud_model.new(entry_params)
    end 
  	if @entry.save 
      if @parent
  	    redirect_to [@parent, @entry], notice: "Creado"
      else 
        redirect_to @entry, notice: "Creado"
      end
  	end
  end

  def update
  	@entry.update(entry_params)
    if @parent
  	  redirect_to [@parent, @entry], notice: "Actualizado"
    else 
      redirect_to @entry, notice: "Actualizado"
    end
  end

  def destroy
  	@entry.destroy
    if @parent
      redirect_to polymorphic_path([@parent, @crud_model]), notice: "Borrado"
    else
  	  redirect_to polymorphic_path(@crud_model), notice: "Borrado"
    end
  end

  private 
  def set_parent
    if @crud_parent
      parent_model ||= "#{@crud_parent}".classify.constantize 
      parent_id ||= :"#{@crud_parent}_id"
      @parent = parent_model.find(params[parent_id])
    end
  end
  def set_entry
  	@entry = @crud_model.find(params[:id])
  end

  def entry_params
  	model_identifier = @crud_model.model_name.param_key
  	params.require(model_identifier).permit(crud_attrs)
  end

end
