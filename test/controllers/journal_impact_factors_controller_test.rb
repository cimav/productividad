require 'test_helper'

class JournalImpactFactorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @journal_impact_factor = journal_impact_factors(:one)
  end

  test "should get index" do
    get journal_impact_factors_url
    assert_response :success
  end

  test "should get new" do
    get new_journal_impact_factor_url
    assert_response :success
  end

  test "should create journal_impact_factor" do
    assert_difference('JournalImpactFactor.count') do
      post journal_impact_factors_url, params: { journal_impact_factor: { impact_factor: @journal_impact_factor.impact_factor, journal_id: @journal_impact_factor.journal_id, year: @journal_impact_factor.year } }
    end

    assert_redirected_to journal_impact_factor_url(JournalImpactFactor.last)
  end

  test "should show journal_impact_factor" do
    get journal_impact_factor_url(@journal_impact_factor)
    assert_response :success
  end

  test "should get edit" do
    get edit_journal_impact_factor_url(@journal_impact_factor)
    assert_response :success
  end

  test "should update journal_impact_factor" do
    patch journal_impact_factor_url(@journal_impact_factor), params: { journal_impact_factor: { impact_factor: @journal_impact_factor.impact_factor, journal_id: @journal_impact_factor.journal_id, year: @journal_impact_factor.year } }
    assert_redirected_to journal_impact_factor_url(@journal_impact_factor)
  end

  test "should destroy journal_impact_factor" do
    assert_difference('JournalImpactFactor.count', -1) do
      delete journal_impact_factor_url(@journal_impact_factor)
    end

    assert_redirected_to journal_impact_factors_url
  end
end
