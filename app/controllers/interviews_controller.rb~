class InterviewsController < ApplicationController
  before_filter :check_status

  # GET /interviews/1/edit
  # requires: logged in as admin
  # effects: returns interview edit form
  def edit
    @interview = Interview.find(params[:id])
    if @interview.user_id != @current_user.id
      flash[:notice] = 'You don\'t have permission to edit this data.'
      redirect_to root_url + 'companies/' + params[:id] + '/interviews'
    end
  end

  # POST /interviews
  # requires: user logged in
  # modifies: Interview table
  # effects: create new interview and redirects to company's interview page
  def create
    #@interview = Interview.add_interview(params, @current_user)
    #render :interview, :layout => false
    render 'static_pages/home'
  end

  # PUT /interviews/1
  # requires: interview exists with given id
  # modifies: Interview table
  # effects: updated interview with given attributes
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
  # requires: logged in as admin and interview with given id
  # modifies: Interview table
  # effects: destroys interview
  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy

    respond_to do |format|
      format.html { redirect_to interviews_url }
      format.json { head :no_content }
    end
  end

end
