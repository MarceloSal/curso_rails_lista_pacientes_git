require "application_system_test_case"

class PatientlistsTest < ApplicationSystemTestCase
  setup do
    @patientlist = patientlists(:one)
  end

  test "visiting the index" do
    visit patientlists_url
    assert_selector "h1", text: "Patientlists"
  end

  test "creating a Patientlist" do
    visit patientlists_url
    click_on "New Patientlist"

    fill_in "Email", with: @patientlist.email
    fill_in "Register name", with: @patientlist.register_name
    click_on "Create Patientlist"

    assert_text "Patientlist was successfully created"
    click_on "Back"
  end

  test "updating a Patientlist" do
    visit patientlists_url
    click_on "Edit", match: :first

    fill_in "Email", with: @patientlist.email
    fill_in "Register name", with: @patientlist.register_name
    click_on "Update Patientlist"

    assert_text "Patientlist was successfully updated"
    click_on "Back"
  end

  test "destroying a Patientlist" do
    visit patientlists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Patientlist was successfully destroyed"
  end
end
