require "application_system_test_case"

class Admins::OrganizationsTest < ApplicationSystemTestCase
  setup do
    @admins_organization = admins_organizations(:one)
  end

  test "visiting the index" do
    visit admins_organizations_url
    assert_selector "h1", text: "Admins/Organizations"
  end

  test "creating a Organization" do
    visit admins_organizations_url
    click_on "New Admins/Organization"

    fill_in "Address", with: @admins_organization.address
    fill_in "Created by", with: @admins_organization.created_by
    fill_in "Email", with: @admins_organization.email
    fill_in "Encrypted password", with: @admins_organization.encrypted_password
    fill_in "Name", with: @admins_organization.name
    fill_in "Tax", with: @admins_organization.tax_id
    fill_in "Username", with: @admins_organization.username
    click_on "Create Organization"

    assert_text "Organization was successfully created"
    click_on "Back"
  end

  test "updating a Organization" do
    visit admins_organizations_url
    click_on "Edit", match: :first

    fill_in "Address", with: @admins_organization.address
    fill_in "Created by", with: @admins_organization.created_by
    fill_in "Email", with: @admins_organization.email
    fill_in "Encrypted password", with: @admins_organization.encrypted_password
    fill_in "Name", with: @admins_organization.name
    fill_in "Tax", with: @admins_organization.tax_id
    fill_in "Username", with: @admins_organization.username
    click_on "Update Organization"

    assert_text "Organization was successfully updated"
    click_on "Back"
  end

  test "destroying a Organization" do
    visit admins_organizations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Organization was successfully destroyed"
  end
end
