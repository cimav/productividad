class PersonTopicsController < ApplicationController

  def ui
  	@person = Person.find(params[:person_id])
    render layout: false
  end

  def topic_list
  	@person = Person.find(params[:person_id])
    render layout: false
  end

  def delete_topic
  	@person_topic = PersonTopic.find(params[:id])
    if @person_topic.delete
      json = {}
      json[:id] = @person_topic.id
      render :json => json
    else
      flash[:error] = 'No se pudo eliminar el área de interes'
      json = {}
      json[:flash] = flash
      json[:errors] = @person_topic.errors
      render :json => json, :status => :unprocessable_entity
    end
  end


  def add_topic
  	@person = Person.find(params[:person_id])
  	@person_topic = @person.person_topics.new

    if params[:topic_id] != "0"
  	  @person_topic.topic_id = params[:topic_id]
    else 
      topic = Topic.new
      topic.name = params[:name]
      if topic.save
        @person_topic.topic_id = topic.id
      end
    end

    if @person_topic.save
      json = {}
      json[:id] = @person_topic.id
      json[:message] = 'Área de interes agregada'
      render :json => json
    else
      flash[:error] = 'No se pudo agregar el área de interes'
      render inline: 'ERROR'
      
    end
  end


end
