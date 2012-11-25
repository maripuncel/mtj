class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :user_id
  belongs_to :question

  def self.add_answer(params)
    answer = Answer.new
    answer.content = params[:content]
    answer.question_id = params[:question]
    answer.user_id = 1
    answer.save!
    return answer
  end
end
