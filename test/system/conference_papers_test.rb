require "application_system_test_case"

class ConferencePapersTest < ApplicationSystemTestCase
  setup do
    @conference_paper = conference_papers(:one)
  end

  test "visiting the index" do
    visit conference_papers_url
    assert_selector "h1", text: "Conference Papers"
  end

  test "creating a Conference paper" do
    visit conference_papers_url
    click_on "New Conference Paper"

    fill_in "Abstract", with: @conference_paper.abstract
    fill_in "Accepted date", with: @conference_paper.accepted_date
    fill_in "Authors", with: @conference_paper.authors
    fill_in "Conference", with: @conference_paper.conference
    fill_in "Person", with: @conference_paper.person
    fill_in "Published date", with: @conference_paper.published_date
    fill_in "Sent date", with: @conference_paper.sent_date
    fill_in "Status", with: @conference_paper.status
    fill_in "Title", with: @conference_paper.title
    click_on "Create Conference paper"

    assert_text "Conference paper was successfully created"
    click_on "Back"
  end

  test "updating a Conference paper" do
    visit conference_papers_url
    click_on "Edit", match: :first

    fill_in "Abstract", with: @conference_paper.abstract
    fill_in "Accepted date", with: @conference_paper.accepted_date
    fill_in "Authors", with: @conference_paper.authors
    fill_in "Conference", with: @conference_paper.conference
    fill_in "Person", with: @conference_paper.person
    fill_in "Published date", with: @conference_paper.published_date
    fill_in "Sent date", with: @conference_paper.sent_date
    fill_in "Status", with: @conference_paper.status
    fill_in "Title", with: @conference_paper.title
    click_on "Update Conference paper"

    assert_text "Conference paper was successfully updated"
    click_on "Back"
  end

  test "destroying a Conference paper" do
    visit conference_papers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Conference paper was successfully destroyed"
  end
end
