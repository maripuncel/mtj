class Question < ActiveRecord::Base
  attr_accessible :company_id, :content, :user_id
  belongs_to :company

  def self.add_question(params)
    question = Question.new
    question.content = params[:content]
    question.company_id = params[:company]
    question.user_id = 1
    question.save!
    return question
  end
end
