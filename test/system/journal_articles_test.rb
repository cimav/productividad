require "application_system_test_case"

class JournalArticlesTest < ApplicationSystemTestCase
  setup do
    @journal_article = journal_articles(:one)
  end

  test "visiting the index" do
    visit journal_articles_url
    assert_selector "h1", text: "Journal Articles"
  end

  test "creating a Journal article" do
    visit journal_articles_url
    click_on "New Journal Article"

    fill_in "Abstract", with: @journal_article.abstract
    fill_in "Accepted date", with: @journal_article.accepted_date
    fill_in "Authors", with: @journal_article.authors
    fill_in "Doi", with: @journal_article.doi
    fill_in "Issue", with: @journal_article.issue
    fill_in "Journal", with: @journal_article.journal_id
    fill_in "Pages", with: @journal_article.pages
    fill_in "Person", with: @journal_article.person_id
    fill_in "Published date", with: @journal_article.published_date
    fill_in "Sent date", with: @journal_article.sent_date
    fill_in "Status", with: @journal_article.status
    fill_in "Title", with: @journal_article.title
    fill_in "Volume", with: @journal_article.volume
    click_on "Create Journal article"

    assert_text "Journal article was successfully created"
    click_on "Back"
  end

  test "updating a Journal article" do
    visit journal_articles_url
    click_on "Edit", match: :first

    fill_in "Abstract", with: @journal_article.abstract
    fill_in "Accepted date", with: @journal_article.accepted_date
    fill_in "Authors", with: @journal_article.authors
    fill_in "Doi", with: @journal_article.doi
    fill_in "Issue", with: @journal_article.issue
    fill_in "Journal", with: @journal_article.journal_id
    fill_in "Pages", with: @journal_article.pages
    fill_in "Person", with: @journal_article.person_id
    fill_in "Published date", with: @journal_article.published_date
    fill_in "Sent date", with: @journal_article.sent_date
    fill_in "Status", with: @journal_article.status
    fill_in "Title", with: @journal_article.title
    fill_in "Volume", with: @journal_article.volume
    click_on "Update Journal article"

    assert_text "Journal article was successfully updated"
    click_on "Back"
  end

  test "destroying a Journal article" do
    visit journal_articles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Journal article was successfully destroyed"
  end
end
