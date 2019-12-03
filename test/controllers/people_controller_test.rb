require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post people_url, params: { person: { department_id: @person.department_id, description: @person.description, email: @person.email, end_date: @person.end_date, first_name: @person.first_name, last_name: @person.last_name, organization_id: @person.organization_id, people_id: @person.people_id, reload: @person.reload, start_date: @person.start_date, status: @person.status } }
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { department_id: @person.department_id, description: @person.description, email: @person.email, end_date: @person.end_date, first_name: @person.first_name, last_name: @person.last_name, organization_id: @person.organization_id, people_id: @person.people_id, reload: @person.reload, start_date: @person.start_date, status: @person.status } }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
