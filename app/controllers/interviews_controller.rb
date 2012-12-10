class InterviewsController < ApplicationController
  before_filter :check_status


  # POST /interviews
  # requires: user logged in
  # modifies: Interview table
  # effects: create new interview and redirects to company's interview page
  def create
    @interview = Interview.add_interview(params, @current_user)
    render :interview, :layout => false
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

end
