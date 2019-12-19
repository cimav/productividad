class PersonResearchLinesController < ApplicationController

  def ui
  	@person = Person.find(params[:person_id])
    render layout: false
  end

  def delete_research_line
  	@person_research_line = PersonResearchLine.where(person_id: params[:person_id], research_line_id: params[:research_line_id]).first
    if @person_research_line.delete
      json = {}
      json[:id] = @person_research_line.id
      render :json => json
    else
      flash[:error] = 'No se pudo eliminar la línea de investigación'
      json = {}
      json[:flash] = flash
      json[:errors] = @person_research_line.errors
      render :json => json, :status => :unprocessable_entity
    end
  end


  def add_research_line
  	@person = Person.find(params[:person_id])
  	@person_research_line = @person.person_research_lines.new
  	@person_research_line.research_line_id = params[:research_line_id]
    

    if @person_research_line.save
      json = {}
      json[:id] = @person_research_line.id
      json[:message] = 'Línea de investigación agregada'
      render :json => json
    else
      flash[:error] = 'No se pudo agregar la línea de investigación'
      json = {}
      json[:flash] = flash
      json[:errors] = @person_research_line.errors
      render :json => json, :status => :unprocessable_entity
    end
  end


end

