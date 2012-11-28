class QuestionsController < ApplicationController

  before_filter :check_status

  def check_status
    if !current_user()
      flash.now[:notice] = 'You must log in to view that page'
      redirect_to "/login"
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    if @question.user_id != @current_user.id
      flash[:notice] = 'You don\'t have permission to edit this data.'
      redirect_to root_url + 'companies/' + params[:id] + '/questions'
    end
  end

  # POST /questions
  # POST /questions.json
  def create
    Question.add_question(params, @current_user)
    render :text => root_url + 'companies/' + params[:company] + '/questions'
  end

  def answer
    @question = Question.find(params[:id])
    @answers = @question.answers.all
  end

  def new_answer
    @question = Question.find(params[:id])
  end

  # PUT /questions/1
  # PUT /questions/1.json
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
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end
end
