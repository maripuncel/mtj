require 'test_helper'

class InterviewsControllerTest < ActionController::TestCase
  setup do
    @interview = interviews(:one)
  end

  test "should create interview" do
    assert_difference('Interview.count') do
      post :create, interview: { company_id: @interview.company_id, content: @interview.content, user_id: @interview.user_id }
    end

    assert_redirected_to interview_path(assigns(:interview))
  end

  test "should get edit" do
    get :edit, id: @interview
    assert_response :success
  end


  test "should destroy interview" do
    assert_difference('Interview.count', -1) do
      delete :destroy, id: @interview
    end

    assert_redirected_to interviews_path
  end
end
