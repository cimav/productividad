class JournalArticlesController < ApplicationController
  before_action :auth_required

  before_action :set_journal_article, only: [:show, :edit, :update, :destroy]
  before_action :set_person


  # GET /journal_articles
  # GET /journal_articles.json
  def index
    @journal_articles = JournalArticle.all
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
