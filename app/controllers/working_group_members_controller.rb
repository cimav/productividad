class WorkingGroupMembersController < ApplicationController
  before_action :auth_required
  
  before_action :set_working_group
  before_action :set_working_group_member, only: [:show, :edit, :update, :destroy]

  def index

    year = params[:year]
       
    @all_working_group_members = @working_group.working_group_members

    @working_group_members = @all_working_group_members

    if !year.blank?
      if year != 'todos'
        @working_group_members = @working_group_members.where("YEAR(last_date) <= ?", year)
      end
    else
      year = Date.today.year
      @working_group_members = @working_group_members.where("YEAR(last_date) <= ?", year)
    end

    @filter_year = year

    @working_group_members = @working_group_members.order(last_date: :desc)

    min_date = @all_working_group_members.minimum(:last_date)
    
    @min_year = min_date.year rescue year
  end

  def show
    
  end

  def new
    @working_group_member = @working_group.working_group_members.new

  end

  def edit

  end

  def create
    @working_group_member = @working_group.working_group_members.new(working_group_member_params)
    @working_group_member.last_date = @working_group_member.start_date
    @working_group_member.status     = WorkingGroupMember::ACTIVE

    if @working_group_member.save
      log = @working_group_member.activity_logs.new 
      log.message = "Participante agregado"
      log.person_id = current_user.id
      log.save
      redirect_to  working_group_working_group_members_path(@working_group), notice: "Participante agregado"
    else 
       puts @working_group_member.errors.full_messages
    end
  end

  def update

      if @working_group_member.update(working_group_member_params)
        changes = @working_group_member.changes
        if @working_group_member.status == WorkingGroupMember::ACTIVE
          @working_group_member.last_date = params[:working_group_member][:start_date]
        else 
          @working_group_member.last_date = params[:working_group_member][:end_date]
        end
    
        @working_group_member.save


        log = @working_group_member.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "Participante #{@working_group_member.id} ha sido actualizada."
        log.save
          
        redirect_to  working_group_working_group_members_path(@working_group), notice: "Participante actualizado"
      else
        redirect_to  working_group_working_group_member_path(@working_group), notice: "Error"      
      end

  end

  def destroy
    @working_group_member.destroy
    respond_to do |format|
      format.html { redirect_to working_group_members_url, notice: 'Participante ha sido eliminada.' }
      format.json { head :no_content }
    end
  end

  private

    def set_working_group
      @working_group = WorkingGroup.find(params[:working_group_id])
    end

    def set_working_group_member
      @working_group_member = WorkingGroupMember.find(params[:id])
    end

    def working_group_member_params
      params.require(:working_group_member).permit(:activities, :working_group_id, :working_group_role_id, :start_date, :end_date, :person_id, :status)
    end
end

