class JournalArticlesController < ApplicationController
  before_action :auth_required

  before_action :set_journal_article, only: [:show, :edit, :update, :destroy]
  before_action :set_person

  def index

    year = params[:year]
 
    @filter_status = params[:status] 
    case @filter_status
      when "enviados"
        status = JournalArticle::SENT
      when "aceptados"
        status = JournalArticle::ACCEPTED
      when "publicados"
        status = JournalArticle::PUBLISHED
      when "rechazados"
        status = JournalArticle::REJECTED
      else
        @filter_status = 'todos'
    end
       
    @all_journal_articles = JournalArticle.left_outer_joins(:product_participants).where("(product_participants.person_id=? AND product_participants.status=?) OR (journal_articles.person_id = ?)", @person.id, ProductParticipant::ACTIVE, @person.id).group('journal_articles.id') 
    
    @journal_articles = @all_journal_articles


    if params[:status] == 'todos'
      if !year.blank? && year != 'todos'
        @journal_articles = @journal_articles.where("YEAR(last_date) = ?", year)
      end
    elsif !status.blank? && !year.blank? && year != 'todos'
      @journal_articles = @journal_articles.where("journal_articles.status = ? AND YEAR(last_date) = ?", status, year)
    elsif !status.blank?
      @journal_articles = @journal_articles.where("journal_articles.status = ?", status)
    else
      year = Date.today.year
      @journal_articles = @journal_articles.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @journal_articles = @journal_articles.order(last_date: :desc)
    @min_year = min_date.year rescue year
    render :layout => 'profile'
  end

  def org_index
    year = params[:year]
    @filter_status = params[:status] 

    case @filter_status
      when "enviados"
        status = JournalArticle::SENT
      when "aceptados"
        status = JournalArticle::ACCEPTED
      when "publicados"
        status = JournalArticle::PUBLISHED
      when "rechazados"
        status = JournalArticle::REJECTED
      else
        @filter_status = 'todos'
    end
      
    @all_journal_articles = JournalArticle.all
    @journal_articles = @all_journal_articles

    if params[:status] == 'todos'
      if !year.blank? && year != 'todos'
        @journal_articles = @journal_articles.where("YEAR(last_date) = ?", year)
      end
    elsif !status.blank? && !year.blank? && year != 'todos'
      @journal_articles = @journal_articles.where("journal_articles.status = ? AND YEAR(last_date) = ?", status, year)
    elsif !status.blank?
      @journal_articles = @journal_articles.where("journal_articles.status = ?", status)
    else
      year = Date.today.year
      @journal_articles = @journal_articles.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year
    @journal_articles = @journal_articles.order(last_date: :desc)
    min_date = @all_journal_articles.minimum(:last_date)
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
    @journal_article = JournalArticle.new
    render :layout => 'profile'
  end

  def edit
    render :layout => 'profile'
  end

  def create
    @journal_article = JournalArticle.new
    @journal_article.title      = params[:title]
    @journal_article.sent_date  = params[:sent_date]
    @journal_article.authors    = params[:authors]
    @journal_article.journal_id = params[:journal_id]
    @journal_article.person_id  = current_user.id
    @journal_article.status     = JournalArticle::SENT
    @journal_article.last_date  = @journal_article.sent_date

    if @journal_article.save
      log = @journal_article.activity_logs.new 
      log.message = "Artículo agregado: #{@journal_article.title}"
      log.person_id = current_user.id
      log.save
      render json: @journal_article
    end
  end

  def update
    respond_to do |format|

      if @journal_article.update(journal_article_params)
        changes = @journal_article.changes
        if @journal_article.status == JournalArticle::SENT
          @journal_article.last_date = @journal_article.sent_date
        elsif @journal_article.status == JournalArticle::ACCEPTED
          @journal_article.last_date = @journal_article.accepted_date
        elsif @journal_article.status == JournalArticle::PUBLISHED
          @journal_article.last_date = @journal_article.published_date
        elsif @journal_article.status == JournalArticle::REJECTED
          @journal_article.last_date = @journal_article.rejected_date
        end
      
        @journal_article.save

        log = @journal_article.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "El artículo #{@journal_article.id} ha sido actualizado."
        log.save
          
        format.html { redirect_to edit_journal_article_path(@person.shortname, @journal_article.id), notice: 'El artículo ha sido actualizado' }
        format.json { render :show, status: :ok, location: @journal_article }
      else
        format.html { render :edit }
        format.json { render json: @journal_article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @journal_article.destroy
    respond_to do |format|
      format.html { redirect_to journal_articles_url, notice: 'El artículo ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private

    def set_journal_article
      @journal_article = JournalArticle.find(params[:id])
    end

    def journal_article_params
      params.require(:journal_article).permit(:title, :sent_date, :accepted_date, :published_date, :journal_id, :authors, :volume, :issue, :pages, :doi, :abstract, :person_id, :status)
    end
end
