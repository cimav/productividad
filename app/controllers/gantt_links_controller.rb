class GanttLinksController < ApplicationController
  protect_from_forgery


  def update
    link = GanttLink.find(params["id"])
    link.source = params["source"]
    link.target = params["target"]
    link.link_type = params["type"]
    link.save

    render :json => {:action => "updated"}
  end

  def add
    link = GanttLink.create(
      :project_id => params[:project_id],
      :source => params["source"],
      :target => params["target"],
      :link_type => params["type"]
    )

    render :json => {:action => "inserted", :tid => link.id}
  end

  def delete
    GanttLink.find(params["id"]).destroy
    render :json => {:action => "deleted"}
  end
end
