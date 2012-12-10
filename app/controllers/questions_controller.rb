class QuestionsController < ApplicationController

  before_filter :check_status

  # GET /questions/1/edit
  # requires: logged in as admin and question exists with given id
  # effects: returns question edit form
  def edit
    @question = Question.find(params[:id])
    if @question.user_id != @current_user.id
      flash[:notice] = 'You don\'t have permission to edit this data.'
      redirect_to root_url + 'companies/' + params[:id] + '/questions'
    end
  end

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
    @answer = @question.add_answer(params, @current_user)
    render :answer, :layout => false
  end

  # PUT /questions/1
  # requires: user logged in as admin and question exists with given id
  # modifies: Question table
  # effects: updates question attributes
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # requires: user logged in as admin and question exists with given id
  # modifies: Question table
  # effects: question destroyed
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
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
