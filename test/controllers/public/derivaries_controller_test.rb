require "test_helper"

class Public::DerivariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_derivaries_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_derivaries_edit_url
    assert_response :success
  end
end
