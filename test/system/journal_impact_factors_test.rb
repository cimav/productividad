require "application_system_test_case"

class JournalImpactFactorsTest < ApplicationSystemTestCase
  setup do
    @journal_impact_factor = journal_impact_factors(:one)
  end

  test "visiting the index" do
    visit journal_impact_factors_url
    assert_selector "h1", text: "Journal Impact Factors"
  end

  test "creating a Journal impact factor" do
    visit journal_impact_factors_url
    click_on "New Journal Impact Factor"

    fill_in "Impact factor", with: @journal_impact_factor.impact_factor
    fill_in "Journal", with: @journal_impact_factor.journal_id
    fill_in "Year", with: @journal_impact_factor.year
    click_on "Create Journal impact factor"

    assert_text "Journal impact factor was successfully created"
    click_on "Back"
  end

  test "updating a Journal impact factor" do
    visit journal_impact_factors_url
    click_on "Edit", match: :first

    fill_in "Impact factor", with: @journal_impact_factor.impact_factor
    fill_in "Journal", with: @journal_impact_factor.journal_id
    fill_in "Year", with: @journal_impact_factor.year
    click_on "Update Journal impact factor"

    assert_text "Journal impact factor was successfully updated"
    click_on "Back"
  end

  test "destroying a Journal impact factor" do
    visit journal_impact_factors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Journal impact factor was successfully destroyed"
  end
end
