class Company < ActiveRecord::Base
  attr_accessible :name

  has_many :interviews
  has_many :offers
  has_many :questions

  # requires: array of offers
  # effects: returns average of array or string message
  def offer_average
    if self.offers.any?
      return self.offers.all.sum(&:figure)/self.offers.count
    else
      return "No offers yet..."
    end
  end

  # requires: array of ratings
  # effects: returns average of array or string message
  def rating_average
    if self.interviews.any?
      return self.interviews.all.sum(&:rating)/self.interviews.count
    else
      return "No interviews yet..."
    end
  end

end
