class AssociationMembersController < ApplicationController
  before_action :auth_required

  before_action :set_association_member, only: [:show, :edit, :update, :destroy]
  before_action :set_person


  def index

    year = params[:year]
       
    @all_association_members = AssociationMember.where("association_members.person_id = ?", @person.id)

    @association_members = @all_association_members

    if !year.blank?
      if year != 'todos'
        @association_members = @association_members.where("YEAR(last_date) <= ?", year)
      end
    else
      year = Date.today.year
      @association_members = @association_members.where("YEAR(last_date) <= ?", year)
    end

    @filter_year = year

    @association_members = @association_members.order(last_date: :desc)

    min_date = @all_association_members.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'profile'
  end

  def org_index

    year = params[:year]
       
    @all_associations = Association.joins(:association_members)

    @associations = @all_associations

    if !year.blank?
      if year != 'todos'
        @associations = @associations.where("YEAR(last_date) <= ?", year)
      end
    else
      year = Date.today.year
      @associations = @associations.where("YEAR(last_date) <= ?", year)
    end

    @filter_year = year

    @association = @associations.order(:name, last_date: :desc)

    min_date = @all_associations.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'org'
  end

  def show
    layout = 'org'
    if !@person.blank?
      layout = 'profile'
    end
    render :layout => layout
  end

  def new
    @association_member = AssociationMember.new
    render :layout => 'profile'
  end

  def edit
    render :layout => 'profile'
  end

  def create
    @association_member = AssociationMember.new
    @association_member.association_id = params[:association_id]
    @association_member.activities  = params[:activities]
    @association_member.start_date = params[:start_date]
    @association_member.person_id  = current_user.id
    @association_member.last_date = params[:start_date]
    @association_member.status     = AssociationMember::ACTIVE

    if @association_member.save
      log = @association_member.activity_logs.new 
      log.message = "Asociación agregada"
      log.person_id = current_user.id
      log.save
      render json: @association_member
    else 
       puts @association_member.errors.full_messages
    end
  end

  def update
    respond_to do |format|

      if @association_member.update(association_member_params)
        changes = @association_member.changes
        if @association_member.status == AssociationMember::ACTIVE
          @association_member.last_date = params[:association_member][:start_date]
        else 
          @association_member.last_date = params[:association_member][:end_date]
        end
    
        @association_member.save

        log = @association_member.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "Asociación #{@association_member.id} ha sido actualizada."
        log.save
          
        format.html { redirect_to edit_association_member_path(@person.shortname, @association_member.id), notice: 'Asociación ha sido actualizado' }
        format.json { render :show, status: :ok, location: @association_member }
      else
        format.html { render :edit }
        format.json { render json: @association_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @association_member.destroy
    respond_to do |format|
      format.html { redirect_to association_members_url, notice: 'Asociación ha sido eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    def set_association_member
      @association_member = AssociationMember.find(params[:id])
    end

    def association_member_params
      params.require(:association_member).permit(:activities, :association_id, :start_date, :end_date, :person_id, :status)
    end
end
