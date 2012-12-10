class Vote < ActiveRecord::Base
  attr_accessible :answer_id, :question, :question_id, :user_id

  belongs_to :user

end
