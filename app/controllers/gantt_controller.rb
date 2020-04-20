class GanttController < ApplicationController

  #before_action :set_project
  #before_action :set_person

  def index
    email = params[:email]
    if !email.include? '@'
      email += '@' + main_organization.domain
    end
    @person = Person.find_by_email(email)
    @project = Project.find(params[:id])

    render :layout => 'profile'
  end

  def data
  	@project = Project.find(params[:project_id])
    tasks = @project.gantt_tasks.all
    links = @project.gantt_links.all

    render :json=>{
      :data => tasks.order(:sortorder).map{|task|{
        :id => task.id,
        :text => task.text,
        :start_date => task.start_date.to_formatted_s(:db),
        :duration => task.duration,
        :progress => task.progress,
        :parent => task.parent,
        :open => true
      }},
      :links => links.map{|link|{
        :id => link.id,
        :source => link.source,
        :target => link.target,
        :type => link.link_type
      }}
    }
  end

end