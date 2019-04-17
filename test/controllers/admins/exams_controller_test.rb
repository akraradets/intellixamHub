require 'test_helper'

class Admins::ExamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_exams_index_url
    assert_response :success
  end

end
