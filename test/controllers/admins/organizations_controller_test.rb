require 'test_helper'

class Admins::OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admins_organization = admins_organizations(:one)
  end

  test "should get index" do
    get admins_organizations_url
    assert_response :success
  end

  test "should get new" do
    get new_admins_organization_url
    assert_response :success
  end

  test "should create admins_organization" do
    assert_difference('Admins::Organization.count') do
      post admins_organizations_url, params: { admins_organization: { address: @admins_organization.address, created_by: @admins_organization.created_by, email: @admins_organization.email, encrypted_password: @admins_organization.encrypted_password, name: @admins_organization.name, tax_id: @admins_organization.tax_id, username: @admins_organization.username } }
    end

    assert_redirected_to admins_organization_url(Admins::Organization.last)
  end

  test "should show admins_organization" do
    get admins_organization_url(@admins_organization)
    assert_response :success
  end

  test "should get edit" do
    get edit_admins_organization_url(@admins_organization)
    assert_response :success
  end

  test "should update admins_organization" do
    patch admins_organization_url(@admins_organization), params: { admins_organization: { address: @admins_organization.address, created_by: @admins_organization.created_by, email: @admins_organization.email, encrypted_password: @admins_organization.encrypted_password, name: @admins_organization.name, tax_id: @admins_organization.tax_id, username: @admins_organization.username } }
    assert_redirected_to admins_organization_url(@admins_organization)
  end

  test "should destroy admins_organization" do
    assert_difference('Admins::Organization.count', -1) do
      delete admins_organization_url(@admins_organization)
    end

    assert_redirected_to admins_organizations_url
  end
end
