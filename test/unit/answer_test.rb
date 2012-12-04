require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
 test "Create Answer" do
   first = Answer.new(:content => "Content 1", :question_id => 1, :user_id => 1)
   assert(first.content == "Content 1")
   first.set_content("Content 2")
   assert(first.content == "Content 2")
  end
end
