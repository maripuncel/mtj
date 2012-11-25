class Question < ActiveRecord::Base
  attr_accessible :company_id, :content, :user_id
  belongs_to :company
  has_many :answers

  def self.add_question(params, current_user)
    question = Question.new
    question.content = params[:content]
    question.company_id = params[:company]
    question.user_id = current_user.id
    question.save!
    return question
  end
end
