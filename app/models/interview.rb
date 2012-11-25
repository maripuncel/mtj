class Interview < ActiveRecord::Base
  attr_accessible :company_id, :content, :user_id

  belongs_to :company

  def self.add_interview(params, current_user)
    interview = Interview.new
    interview.content = params[:content]
    interview.company_id = params[:company]
    interview.user_id = current_user.id
    interview.save!
    return interview
  end
end
