class User < ActiveRecord::Base
  attr_accessible :email, :password, :activated, :serial, :admin

  has_many :votes

  def activate()
    self.update_attribute(:activated, true)
  end

  def change_password(newpass)
    self.update_attribute(:password, newpass)
  end

  def upvote(question)
    vote = Vote.new
    vote.user_id = self.id
    vote.question_id = question.id
    vote.question = true
    vote.save!
  end

  def downvote(question)
    vote = Vote.find_by_question_id_and_user_id(question.id, self.id)
    vote.destroy
  end

  def has_voted(question)
    vote = Vote.find_by_question_id_and_user_id(question.id, self.id)
    if vote
      return true
    else
      return false
    end
  end
end
