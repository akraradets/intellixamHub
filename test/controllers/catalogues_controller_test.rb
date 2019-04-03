require 'test_helper'

class CataloguesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get catalogues_index_url
    assert_response :success
  end

end
