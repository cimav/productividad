require 'test_helper'

class ConferencePapersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conference_paper = conference_papers(:one)
  end

  test "should get index" do
    get conference_papers_url
    assert_response :success
  end

  test "should get new" do
    get new_conference_paper_url
    assert_response :success
  end

  test "should create conference_paper" do
    assert_difference('ConferencePaper.count') do
      post conference_papers_url, params: { conference_paper: { abstract: @conference_paper.abstract, accepted_date: @conference_paper.accepted_date, authors: @conference_paper.authors, conference: @conference_paper.conference, person: @conference_paper.person, published_date: @conference_paper.published_date, sent_date: @conference_paper.sent_date, status: @conference_paper.status, title: @conference_paper.title } }
    end

    assert_redirected_to conference_paper_url(ConferencePaper.last)
  end

  test "should show conference_paper" do
    get conference_paper_url(@conference_paper)
    assert_response :success
  end

  test "should get edit" do
    get edit_conference_paper_url(@conference_paper)
    assert_response :success
  end

  test "should update conference_paper" do
    patch conference_paper_url(@conference_paper), params: { conference_paper: { abstract: @conference_paper.abstract, accepted_date: @conference_paper.accepted_date, authors: @conference_paper.authors, conference: @conference_paper.conference, person: @conference_paper.person, published_date: @conference_paper.published_date, sent_date: @conference_paper.sent_date, status: @conference_paper.status, title: @conference_paper.title } }
    assert_redirected_to conference_paper_url(@conference_paper)
  end

  test "should destroy conference_paper" do
    assert_difference('ConferencePaper.count', -1) do
      delete conference_paper_url(@conference_paper)
    end

    assert_redirected_to conference_papers_url
  end
end
