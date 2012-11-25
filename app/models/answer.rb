class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :user_id
  belongs_to :question

  def self.add_answer(params, current_user)
    answer = Answer.new
    answer.content = params[:content]
    answer.question_id = params[:question]
    answer.user_id = current_user.id
    answer.save!
    return answer
  end
end
