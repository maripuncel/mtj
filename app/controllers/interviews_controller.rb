class InterviewsController < ApplicationController
  # GET /interviews
  # GET /interviews.json
  def index
    @interviews = Interview.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interviews }
    end
  end

  # GET /interviews/1
  # GET /interviews/1.json
  def show
    @company = Company.find(params[:company_id])
    if @company
      @interviews = Interview.where(:company_id => @company.id).all
      render :'interviews/index'
    else
      render :nothing
    end
  end

  # GET /interviews/new
  # GET /interviews/new.json
  def new
    @interview = Interview.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interview }
    end
  end

  # GET /interviews/1/edit
  def edit
    @interview = Interview.find(params[:id])
  end

  # POST /interviews
  # POST /interviews.json
  def create
    Interview.add_interview(params)
    render :text => 'http://localhost:3000/companies/' + params[:company] + '/interviews'
    # TODO fix this redirect
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
