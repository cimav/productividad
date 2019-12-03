require 'test_helper'

class JournalArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @journal_article = journal_articles(:one)
  end

  test "should get index" do
    get journal_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_journal_article_url
    assert_response :success
  end

  test "should create journal_article" do
    assert_difference('JournalArticle.count') do
      post journal_articles_url, params: { journal_article: { abstract: @journal_article.abstract, accepted_date: @journal_article.accepted_date, authors: @journal_article.authors, doi: @journal_article.doi, issue: @journal_article.issue, journal_id: @journal_article.journal_id, pages: @journal_article.pages, person_id: @journal_article.person_id, published_date: @journal_article.published_date, sent_date: @journal_article.sent_date, status: @journal_article.status, title: @journal_article.title, volume: @journal_article.volume } }
    end

    assert_redirected_to journal_article_url(JournalArticle.last)
  end

  test "should show journal_article" do
    get journal_article_url(@journal_article)
    assert_response :success
  end

  test "should get edit" do
    get edit_journal_article_url(@journal_article)
    assert_response :success
  end

  test "should update journal_article" do
    patch journal_article_url(@journal_article), params: { journal_article: { abstract: @journal_article.abstract, accepted_date: @journal_article.accepted_date, authors: @journal_article.authors, doi: @journal_article.doi, issue: @journal_article.issue, journal_id: @journal_article.journal_id, pages: @journal_article.pages, person_id: @journal_article.person_id, published_date: @journal_article.published_date, sent_date: @journal_article.sent_date, status: @journal_article.status, title: @journal_article.title, volume: @journal_article.volume } }
    assert_redirected_to journal_article_url(@journal_article)
  end

  test "should destroy journal_article" do
    assert_difference('JournalArticle.count', -1) do
      delete journal_article_url(@journal_article)
    end

    assert_redirected_to journal_articles_url
  end
end
