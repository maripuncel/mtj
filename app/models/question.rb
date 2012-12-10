class Question < ActiveRecord::Base
  attr_accessible :company_id, :content, :user_id, :id, :votes
  belongs_to :company
  has_many :answers

  # requires: question content, company_id, and current_user
  # modifies: Question table
  # effects: new question created
  def self.add_question(params, current_user)
    question = Question.new
    question.content = params[:content]
    question.company_id = params[:company]
    question.user_id = current_user.id
    question.votes = 0
    question.save!
    return question
  end

  def edit_content(content)
    self.update_attribute(:content, content)
  end

  # requires: answer content and current_user
  # modifies: Answer table
  # effects: creates new answer for given question
  def add_answer(params, current_user)
    answer = Answer.new
    answer.content = params[:answer_content]
    answer.question_id = self.id
    answer.user_id = current_user.id
    answer.save!
    return answer
  end

  # returns the number of votes for given question
  def vote_count
    count = Vote.find_all_by_question_id(self.id)
    if count
      return count.count
    else
      return 0
    end
  end

end
