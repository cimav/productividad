require 'test_helper'

class IndexersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @indexer = indexers(:one)
  end

  test "should get index" do
    get indexers_url
    assert_response :success
  end

  test "should get new" do
    get new_indexer_url
    assert_response :success
  end

  test "should create indexer" do
    assert_difference('Indexer.count') do
      post indexers_url, params: { indexer: { name: @indexer.name, website: @indexer.website } }
    end

    assert_redirected_to indexer_url(Indexer.last)
  end

  test "should show indexer" do
    get indexer_url(@indexer)
    assert_response :success
  end

  test "should get edit" do
    get edit_indexer_url(@indexer)
    assert_response :success
  end

  test "should update indexer" do
    patch indexer_url(@indexer), params: { indexer: { name: @indexer.name, website: @indexer.website } }
    assert_redirected_to indexer_url(@indexer)
  end

  test "should destroy indexer" do
    assert_difference('Indexer.count', -1) do
      delete indexer_url(@indexer)
    end

    assert_redirected_to indexers_url
  end
end
