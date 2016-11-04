require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quiz_index_url
    assert_response :success
  end

  test "should get results" do
    get quiz_results_url
    assert_response :success
  end

end
