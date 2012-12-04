require 'test_helper'

class OffersControllerTest < ActionController::TestCase
  setup do
    @offer = offers(:one)
  end


  test "should create offer" do
    assert_difference('Offer.count') do
      post :create, offer: { company_id: @offer.company_id, figure: @offer.figure, user_id: @offer.user_id }
    end

    assert_redirected_to offer_path(assigns(:offer))
  end


  test "should get edit" do
    get :edit, id: @offer
    assert_response :success
  end

  test "should destroy offer" do
    assert_difference('Offer.count', -1) do
      delete :destroy, id: @offer
    end

    assert_redirected_to offers_path
  end
end
