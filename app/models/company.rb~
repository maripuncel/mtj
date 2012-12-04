class Company < ActiveRecord::Base
  attr_accessible :name

  has_many :interviews
  has_many :offers
  has_many :questions

  # @param [] offers
  def offer_average
    if self.offers.any?
      return self.offers.all.sum(&:figure)/self.offers.count
    else
      return "No offers yet..."
    end
  end
end
