class PersonWorkingGroupsController < ApplicationController
  before_action :auth_required
  before_action :set_person

  def index

    year = params[:year]
       
    @all_person_working_groups = @person.working_group_members

    @person_working_groups = @all_person_working_groups

    if !year.blank?
      if year != 'todos'
        @person_working_groups = @person_working_groups.where("YEAR(last_date) <= ?", year)
      end
    else
      year = Date.today.year
      @person_working_groups = @person_working_groups.where("YEAR(last_date) <= ?", year)
    end

    @filter_year = year

    @person_working_groups = @person_working_groups.order(last_date: :desc)

    min_date = @all_person_working_groups.minimum(:last_date)
    
    @min_year = min_date.year rescue year


    render layout: 'profile'
  end

  private
    def set_person
      email = params[:email]
      if !email.include? '@'
        email += '@' + main_organization.domain
      end
      @person = Person.find_by_email(email)

      if (!@person) 
        redirect_to profiles_url
      end
    end
end

