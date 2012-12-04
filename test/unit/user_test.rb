require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "User Activation" do
    @u = User.new(:email => "test" , :password => "123" , :activated => false, :serial => 111)
    @u.save
    assert(@u.activated == false)
    @u.activate()
    assert(@u.activated == true)
  end
end
