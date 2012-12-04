require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Content Change" do
    @q = Question.new(:company_id => 1, :user_id =>1, :content => "First")
    @q.save
    assert(@q.content == "First")
    @q.edit_content("Second")
    assert(@q.content == "Second")
  end
end
