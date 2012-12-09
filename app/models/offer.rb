class Offer < ActiveRecord::Base
  attr_accessible :company_id, :figure, :user_id
  belongs_to :company

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
