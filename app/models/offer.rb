class Offer < ActiveRecord::Base
  attr_accessible :company_id, :figure, :user_id
  belongs_to :company

  # requires: figure, company, position and current_user
  # modifies: Offers table
  # effects: return new offer
  def self.add_offer(params, current_user)
    offer = Offer.new
    offer.figure = params[:figure]
    offer.company_id = params[:company]
    offer.position = params[:position]
    offer.user_id = current_user.id
    offer.save!
    return offer
  end
end
