class AnswersController < ApplicationController
  
  before_filter :check_status

  # GET /answers/1/edit
  # requires: answer exists with given id and owned by user
  # effects: returns answer edit page
  def edit
    @answer = Answer.find(params[:id])
    if @answer.user_id != @current_user.id
      flash[:notice] = 'You don\'t have permission to edit this data.'
      redirect_to root_url + 'companies/' + params[:company] + '/questions'
    end
  end

  # POST /answers
  # requires: answer content, company name, and user_id
  # modifies: Answer table
  # effects: creates new answer and redirects to company's question page
  def create
    Answer.add_answer(params, @current_user)
    render :text => root_url + 'companies/' + params[:company] + '/questions'
  end

  # PUT /answers/1
  # requires: answer exists with given id
  # modifies: Answer table
  # effects: saves new answer attributes and redirects to answer page
  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # requires: answer exists with given id
  # modifies: Answer table
  # effects: destroys given answer
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end
end
