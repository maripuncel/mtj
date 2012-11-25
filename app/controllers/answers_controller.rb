class AnswersController < ApplicationController
  
  before_filter :check_status

  def check_status
    if !current_user()
      flash.now[:notice] = 'You must log in to view that page'
      render "static_pages/login"
    end
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
    if @answer.user_id != @current_user.id
      flash[:notice] = 'You don\'t have permission to edit this data.'
      redirect_to 'http://localhost:3000/questions/' + params[:id] + '/answers' 
    end
  end

  # POST /answers
  # POST /answers.json
  def create
    Answer.add_answer(params, @current_user)
    render :text => 'http://localhost:3000/questions/' + params[:question] + '/answers'
  end

  # PUT /answers/1
  # PUT /answers/1.json
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
  # DELETE /answers/1.json
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end
end
