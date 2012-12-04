require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  setup do
    @answer = answers(:one)
  end

  test "should create answer" do
    assert_difference('Answer.count') do
      post :create, answer: { content: @answer.content, question_id: @answer.question_id, user_id: @answer.user_id }
    end
  end

  test "should get edit" do
    get :edit, id: @answer
    assert_response :success
  end


  test "should destroy answer" do
    assert_difference('Answer.count', -1) do
      delete :destroy, id: @answer
    end

    assert_redirected_to answers_path
  end
end
