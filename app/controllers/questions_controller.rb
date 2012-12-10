class QuestionsController < ApplicationController

  before_filter :check_status


  # POST /questions
  # requires: user logged in and valid question attributes
  # modifies: Question table
  # effects: creates and renders new question
  def create_question
    @question = Question.add_question(params, @current_user)
    render :question, :layout => false
  end

  # POST /questions/:id/answers
  # requires: user logged in and question exists with given id
  # modifies: Question and Answer table
  # effects: creates and renders new answer
  def create_answer
    @question = Question.find(params[:answer_question])
    @newanswer = @question.add_answer(params, @current_user)
    render :answer, :layout => false
  end

  # POST /questions/upvote/:id
  # requires: user logged in and question exists with given id
  # modifies: Vote table
  # effects: vote for given question and user logged
  def upvote
    @question = Question.find(params[:id])
    @current_user.upvote(@question)
    render :upvote, :layout => false
  end

  # POST /questions/downvote/:id
  # requires: user logged in and question exists with given id
  # and user vote for given question exists
  # modifies: Vote table
  # effects: vote for given question and user removed
  def downvote
    @question = Question.find(params[:id])
    @current_user.downvote(@question)
    render :upvote, :layout => false
  end
end
