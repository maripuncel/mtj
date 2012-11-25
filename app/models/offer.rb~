class Offer < ActiveRecord::Base
  attr_accessible :company_id, :figure, :user_id
  belongs_to :company

  def self.add_offer(params)
    offer = Offer.new
    offer.figure = params[:figure]
    offer.company_id = params[:company]
    offer.user_id = 1
    offer.save!
    return offer
  end
end
