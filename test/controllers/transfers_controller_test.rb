require 'test_helper'

class TransfersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get transfers_create_url
    assert_response :success
  end

end
