require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test "Offer Averages" do
   @comp = Company.new(:name => "Test Company")
   @comp.save
   @firstOffer = Offer.new(:company_id => @comp.id, :figure => 10, :user_id => 1)
   @firstOffer.save
   @secondOffer = Offer.new(:company_id => @comp.id, :figure => 20, :user_id => 2)
   @secondOffer.save
   assert(@comp.offer_average() == 15)
   @thirdOffer = Offer.new(:company_id => @comp.id, :figure => 30, :user_id => 3)
   @thirdOffer.save
   assert(@comp.offer_average() == 20)
  end
end
