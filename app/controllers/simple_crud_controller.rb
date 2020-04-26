class SimpleCrudController < ApplicationController

  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def initialize
  	@crud_title = 'Sin Título'
  	@crud_model ||= controller_path.classify.constantize
  	@crud_limit = 15
  	@crud_layout = 'application'
  	@crud_fields = []
  	self.add_field(:id, "ID", :integer, {hide: true})
  end

  def add_field (field, text, type, options = {})
  	@crud_fields << {field: field, text: text, type: type, options: options}
  end 
  	
  def crud_attrs 
  	c = []
  	@crud_fields.each do |f| 
  	  c << :"#{f[:field]}"
  	end
  	c 
  end

  def index
    #@entries = @crud_model.pluck(*crud_attrs).map { |p| crud_attrs.zip(p).to_h }
    @entries = @crud_model.select(crud_attrs).all.limit(@crud_limit)
    render layout: @crud_layout
  end

  def show
  	render layout: @crud_layout
  end

  def new
  	@entry = @crud_model.new
  	@crud_fields.each do |f|
  	  if !f[:options][:default].blank?
  	  	@entry[f[:field]] = f[:options][:default]
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
