class CompaniesController < ApplicationController

  before_filter :check_status

  def check_status
    if not current_user()
      flash[:notice] = 'You must log in to view that page'
      redirect_to "static_pages/home"
    end
  end

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all(:order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])
    @interviews = Interview.all( :conditions => {:company_id => [@company.id]}, :limit => 3)
    @offer = @company.offer_average
    @questions = Question.all( :conditions => {:company_id => [@company.id]}, :limit => 3)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # Show company interviews
  def interview
    @company = Company.find(params[:id])
    @interviews = @company.interviews.all
  end

  def new_interview
    @company = Company.find(params[:id])
  end

  def offer
    @company = Company.find(params[:id])
    @offers = @company.offers.all
  end

  def new_offer
    @company = Company.find(params[:id])
  end

  def question
    @company = Company.find(params[:id])
    @questions = @company.questions.all
  end

  def new_question
    @company = Company.find(params[:id])
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

end
