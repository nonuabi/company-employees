require "application_system_test_case"

class DevelopersTest < ApplicationSystemTestCase
  setup do
    @developer = developers(:one)
  end

  test "visiting the index" do
    visit developers_url
    assert_selector "h1", text: "Developers"
  end

  test "creating a Developer" do
    visit developers_url
    click_on "New Developer"

    fill_in "Email", with: @developer.email
    fill_in "First name", with: @developer.first_name
    fill_in "Last name", with: @developer.last_name
    fill_in "Phone number", with: @developer.phone_number
    fill_in "Profile", with: @developer.profile
    click_on "Create Developer"

    assert_text "Developer was successfully created"
    click_on "Back"
  end

  test "updating a Developer" do
    visit developers_url
    click_on "Edit", match: :first

    fill_in "Email", with: @developer.email
    fill_in "First name", with: @developer.first_name
    fill_in "Last name", with: @developer.last_name
    fill_in "Phone number", with: @developer.phone_number
    fill_in "Profile", with: @developer.profile
    click_on "Update Developer"

    assert_text "Developer was successfully updated"
    click_on "Back"
  end

  test "destroying a Developer" do
    visit developers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Developer was successfully destroyed"
  end
end
