require 'test_helper'

class PatientlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patientlist = patientlists(:one)
  end

  test "should get index" do
    get patientlists_url
    assert_response :success
  end

  test "should get new" do
    get new_patientlist_url
    assert_response :success
  end

  test "should create patientlist" do
    assert_difference('Patientlist.count') do
      post patientlists_url, params: { patientlist: { email: @patientlist.email, register_name: @patientlist.register_name } }
    end

    assert_redirected_to patientlist_url(Patientlist.last)
  end

  test "should show patientlist" do
    get patientlist_url(@patientlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_patientlist_url(@patientlist)
    assert_response :success
  end

  test "should update patientlist" do
    patch patientlist_url(@patientlist), params: { patientlist: { email: @patientlist.email, register_name: @patientlist.register_name } }
    assert_redirected_to patientlist_url(@patientlist)
  end

  test "should destroy patientlist" do
    assert_difference('Patientlist.count', -1) do
      delete patientlist_url(@patientlist)
    end

    assert_redirected_to patientlists_url
  end
end
