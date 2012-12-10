class OffersController < ApplicationController
  before_filter :check_status

  # POST /offers
  # requires: user logged in and valid offer attributes
  # modifies: Offer table
  # effects: creates new offer and redirects to company offer page
  def create
    Offer.add_offer(params, @current_user)
    redirect_to :back
  end


end
