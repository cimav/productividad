class JournalArticlesController < ApplicationController
  before_action :auth_required

  before_action :set_journal_article, only: [:show, :edit, :update, :destroy]
  before_action :set_person


  # GET /journal_articles
  # GET /journal_articles.json
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
        
    if params[:status] == 'todos'
      if !year.blank?
        @journal_articles = @person.journal_articles.where("YEAR(last_date) = ?", year)
      else 
        @journal_articles = @person.journal_articles.all
      end
    elsif !status.blank? && !year.blank?
      @journal_articles = @person.journal_articles.where("status = ? AND YEAR(last_date) = ?", status, year)
    elsif !status.blank?
      @journal_articles = @person.journal_articles.where("status = ?", status)
    else
      year = Date.today.year
      @journal_articles = @person.journal_articles.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @journal_articles = @journal_articles.order(last_date: :desc)

    min_date = @person.journal_articles.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'profile'
  end

  # GET /journal_articles/1
  # GET /journal_articles/1.json
  def show
    render :layout => 'profile'
  end

  # GET /journal_articles/new
  def new
    @journal_article = JournalArticle.new
    render :layout => 'profile'
  end

  # GET /journal_articles/1/edit
  def edit
    render :layout => 'profile'
  end

  # POST /journal_articles
  # POST /journal_articles.json
  def create
    @journal_article = JournalArticle.new(journal_article_params)
    @journal_article.person_id = current_user.id
    @journal_article.status = JournalArticle::SENT
    @journal_article.last_date = @journal_article.sent_date
    respond_to do |format|
      if @journal_article.save
        format.html { redirect_to journal_article_path(@person.shortname, @journal_article.id), notice: 'El artículo ha sido creado.' }
        format.json { render :show, status: :created, location: @journal_article }
      else
        format.html { render :new }
        format.json { render json: @journal_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journal_articles/1
  # PATCH/PUT /journal_articles/1.json
  def update
    respond_to do |format|
      if @journal_article.update(journal_article_params)

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
          
          
        format.html { redirect_to journal_article_path(@person.shortname, @journal_article.id), notice: 'El artículo ha sido actualizado' }
        format.json { render :show, status: :ok, location: @journal_article }
      else
        format.html { render :edit }
        format.json { render json: @journal_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journal_articles/1
  # DELETE /journal_articles/1.json
  def destroy
    @journal_article.destroy
    respond_to do |format|
      format.html { redirect_to journal_articles_url, notice: 'El artículo ha sido eliminado.' }
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
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_journal_article
      @journal_article = JournalArticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_article_params
      params.require(:journal_article).permit(:title, :sent_date, :accepted_date, :published_date, :journal_id, :authors, :volume, :issue, :pages, :doi, :abstract, :person_id, :status)
    end
end
