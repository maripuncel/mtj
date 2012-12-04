require 'test_helper'

class InterviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Rating Averages" do
   @comp = Company.new(:name => "Test Company")
   @comp.save
   @firstI = Interview.new(:company_id => @comp.id, :content => "Content ", :questions => "hi", :rating => 1, :user_id => 1)
   @firstI.save
   @secondI = Interview.new(:company_id => @comp.id, :content => "Content ", :questions => "hi", :rating => 2, :user_id => 1)
   @secondI.save
   assert(@comp.rating_average() == 1.5)
   @thirdI = Interview.new(:company_id => @comp.id, :content => "Content ", :questions => "hi", :rating => 3, :user_id => 1)
   @thirdI.save
   assert(@comp.rating_average() == 2)
  end
end
