require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
  end

 

 

  test "should create question" do
    assert_difference('Question.count') do
      post :create, question: { company_id: @question.company_id, content: @question.content, user_id: @question.user_id }
    end

    assert_redirected_to question_path(assigns(:question))
  end


  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end


  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
