class GanttTasksController < ApplicationController
  protect_from_forgery

  def update
    task = GanttTask.find(params["id"])
    task.text = params["text"]
    task.start_date = params["start_date"]
    task.duration = params["duration"]
    task.progress = params["progress"] || 0
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
