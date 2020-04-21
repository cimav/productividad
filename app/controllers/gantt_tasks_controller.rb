class GanttTasksController < ApplicationController
  before_action :auth_required

  protect_from_forgery

  def update
    task = GanttTask.find(params["id"])
    task.text = params["text"]
    task.person_id = params["person_id"]
    task.start_date = params["start_date"]
    task.duration = params["duration"]
    if params["progress"]
      task.progress = (params["progress"].to_f * 100).floor
    end
    task.parent = params["parent"]
    task.save

    if(params['target'])
      GanttTask.updateOrder(task.id, params['target'])
    end

    render :json => {:action => "updated"}
  end

  def add
    maxOrder = GanttTask.maximum("sortorder") || 0
    task = GanttTask.create(
      :project_id => params[:project_id],
      :text => params["text"],
      :person_id => params["person_id"],
      :start_date=> params["start_date"],
      :duration => params["duration"],
      :progress => params["progress"] || 0,
      :parent => params["parent"],
      :sortorder => maxOrder + 1
    )

    render :json => {:action => "inserted", :tid => task.id}
  end

  def delete
    GanttTask.find(params["id"]).destroy
    render :json => {:action => "deleted"}
  end
end
