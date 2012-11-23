class Interview < ActiveRecord::Base
  attr_accessible :company_id, :content, :user_id

  belongs_to :company

  def self.add_interview(params)
    interview = Interview.new
    interview.content = params[:content]
    interview.company_id = params[:company]
    interview.user_id = 1
    interview.save!
    return interview
  end
end
