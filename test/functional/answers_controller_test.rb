require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  setup do
    @answer = answers(:one)
  end

  
  test "should get edit" do
    get :edit, id: @answer
    assert_response :success
  end

end
