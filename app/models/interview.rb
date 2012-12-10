class Interview < ActiveRecord::Base
  attr_accessible :company_id, :content, :user_id, :rating, :questions, :position
  belongs_to :company

  # requires: interview content, company, questions,
  #           rating, position and current_user
  # modifies: Interview table
  # effects: returns new interview

  def self.add_interview(params, current_user)
    interview = Interview.new
    interview.content = params[:content]
    interview.company_id = params[:company]
    interview.questions = params[:questions]
    interview.rating = params[:rating]
    interview.position = params[:position]
    interview.user_id = current_user.id
    interview.save!
    return interview
  end

  # Returns the interview position if within the list of common positions
  # Else returns the string "Other"
  def get_position
    all_pos = ["Developer", "Manager", "Trader", "Consultant", "Analyst", "Researcher"]
    if all_pos.include? self.position
      return self.position
    else
      return "Other"
    end
  end
end
