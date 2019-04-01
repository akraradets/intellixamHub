require 'test_helper'

class Admins::LandingPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_landing_page_index_url
    assert_response :success
  end

end
