require 'test_helper'

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:one)
  end

  test "should get index" do
    get organizations_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_url
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post organizations_url, params: { organization: { address1: @organization.address1, address2: @organization.address2, city_id: @organization.city_id, country_id: @organization.country_id, description: @organization.description, email: @organization.email, lat: @organization.lat, long: @organization.long, name: @organization.name, organization_id: @organization.organization_id, status: @organization.status, website: @organization.website } }
    end

    assert_redirected_to organization_url(Organization.last)
  end

  test "should show organization" do
    get organization_url(@organization)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_url(@organization)
    assert_response :success
  end

  test "should update organization" do
    patch organization_url(@organization), params: { organization: { address1: @organization.address1, address2: @organization.address2, city_id: @organization.city_id, country_id: @organization.country_id, description: @organization.description, email: @organization.email, lat: @organization.lat, long: @organization.long, name: @organization.name, organization_id: @organization.organization_id, status: @organization.status, website: @organization.website } }
    assert_redirected_to organization_url(@organization)
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete organization_url(@organization)
    end

    assert_redirected_to organizations_url
  end
end
