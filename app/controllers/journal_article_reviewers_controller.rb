class JournalArticleReviewersController < ApplicationController
  before_action :auth_required

  before_action :set_journal_article_reviewer, only: [:show, :edit, :update, :destroy]
  before_action :set_person


  # GET /journal_article_reviewers
  # GET /journal_article_reviewers.json
  def index

    year = params[:year]
       
    @all_journal_article_reviewers = JournalArticleReviewer.where("journal_article_reviewers.person_id = ?", @person.id)

    @journal_article_reviewers = @all_journal_article_reviewers

    if !year.blank?
      if year != 'todos'
        @journal_article_reviewers = @journal_article_reviewers.where("YEAR(last_date) = ?", year)
      end
    else
      year = Date.today.year
      @journal_article_reviewers = @journal_article_reviewers.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @journal_article_reviewers = @journal_article_reviewers.order(last_date: :desc)

    min_date = @all_journal_article_reviewers.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'profile'
  end

  # GET /journal_article_reviewers/1
  # GET /journal_article_reviewers/1.json
  def show
    render :layout => 'profile'
  end

  # GET /journal_article_reviewers/new
  def new
    @journal_article_reviewer = JournalArticleReviewer.new
    render :layout => 'profile'
  end

  # GET /journal_article_reviewers/1/edit
  def edit
    render :layout => 'profile'
  end

  # POST /journal_article_reviewers
  # POST /journal_article_reviewers.json
  def create
    @journal_article_reviewer = JournalArticleReviewer.new
    @journal_article_reviewer.title = params[:title]
    @journal_article_reviewer.authors  = params[:authors]
    @journal_article_reviewer.review_date = params[:review_date]
    @journal_article_reviewer.journal_id = params[:journal_id]
    @journal_article_reviewer.person_id  = current_user.id
    @journal_article_reviewer.last_date = params[:review_date]

    if @journal_article_reviewer.save
      log = @journal_article_reviewer.activity_logs.new 
      log.message = "Evaluador de artículo agregado"
      log.person_id = current_user.id
      log.save
      render json: @journal_article_reviewer
    else 
       puts @journal_article_reviewer.errors.full_messages
    end
  end

  # PATCH/PUT /journal_article_reviewers/1
  # PATCH/PUT /journal_article_reviewers/1.json
  def update
    respond_to do |format|

      if @journal_article_reviewer.update(journal_article_reviewer_params)
        changes = @journal_article_reviewer.changes
        @journal_article_reviewer.last_date = @journal_article_reviewer.review_date
    
        @journal_article_reviewer.save

        log = @journal_article_reviewer.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "Evaluador de artículo #{@journal_article_reviewer.id} ha sido actualizado."
        log.save
          
        format.html { redirect_to edit_journal_article_reviewer_path(@person.shortname, @journal_article_reviewer.id), notice: 'Evaluador de artículo ha sido actualizado' }
        format.json { render :show, status: :ok, location: @journal_article_reviewer }
      else
        format.html { render :edit }
        format.json { render json: @journal_article_reviewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journal_article_reviewers/1
  # DELETE /journal_article_reviewers/1.json
  def destroy
    @journal_article_reviewer.destroy
    respond_to do |format|
      format.html { redirect_to journal_article_reviewers_url, notice: 'Evaluador de artículo ha sido eliminado.' }
      format.json { head :no_content }
    end
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

    # Use callbacks to share common setup or constraints between actions.
    def set_journal_article_reviewer
      @journal_article_reviewer = JournalArticleReviewer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_article_reviewer_params
      params.require(:journal_article_reviewer).permit(:title, :authors, :review_date, :journal_id, :person_id, :status)
    end
end

