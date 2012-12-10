class InterviewsController < ApplicationController
  before_filter :check_status

  def check_status
    if !current_user()
      flash.now[:notice] = 'You must log in to view that page'
      redirect_to "/login"
    end
  end

  # GET /interviews/1/edit
  def edit
    @interview = Interview.find(params[:id])
    if @interview.user_id != @current_user.id
      flash[:notice] = 'You don\'t have permission to edit this data.'
      redirect_to root_url + 'companies/' + params[:id] + '/interviews'
    end
  end

  # POST /interviews
  # POST /interviews.json
  def create
    @interview = Interview.add_interview(params, @current_user)
    render :text => root_url + 'companies/' + params[:company] + '/interviews'
  end

  # PUT /interviews/1
  # PUT /interviews/1.json
  def update
    @interview = Interview.find(params[:id])

    respond_to do |format|
      if @interview.update_attributes(params[:interview])
        format.html { redirect_to @interview, notice: 'Interview was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.json
  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy

    respond_to do |format|
      format.html { redirect_to interviews_url }
      format.json { head :no_content }
    end
  end

end
