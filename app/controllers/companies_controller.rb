class CompaniesController < ApplicationController

  before_filter :check_status

  # POST /companies/search/:id
  # requires: user logged in
  # effects: prefix search for :id and returns any matching companies
  def search
    if params[:id] == nil
      @notice = "All Companies"
      @companies = Company.all(:order => :name)
    else
      @name = params[:id]
      @companies = Company.find(:all, :conditions => {:name => @name})
      @companies = Company.where("name like :prefix", prefix: "#{@name}%").all(:order => :name)
      @notice = "Companies matching : " + @name
    end
     
    if @companies == []
	    @notice = "No Company named \""+ @name + "\" found."
    end
    render :search, :layout => false
  end

  # GET /companies
  # requires: user logged in
  # effects: returns all companies in db, ordered alphabetically
  def index
    @companies = Company.all(:order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # requires: company exists with given id
  # effects: returns company landing page, with interview, offer, and question info
  def show
    @company = Company.find(params[:id])
    @interview = Interview.all( :conditions => {:company_id => [@company.id]}, :limit => 1)
    @offers = @company.offers.all
    @questions = Question.all( :conditions => {:company_id => [@company.id]}, :limit => 3)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/:id/interviews
  # requires: company exists with given id
  # effects: returns interview landing page
  def interview
    @company = Company.find(params[:id])
    @interviews = @company.interviews.all
  end

  # GET /companies/:id/new_interview
  # requires: company exists with given id
  # effects: returns new interview form
  def new_interview
    @company = Company.find(params[:id])
  end

  # GET /companies/:id/offers
  # requires: company exists with given id
  # effects: returns offer landing page
  def offer
    @company = Company.find(params[:id])
    @offers = @company.offers.all
  end

  # GET /companies/:id/new_offer
  # requires: company exists with given id
  # effects: returns new offer form
  def new_offer
    @company = Company.find(params[:id])
  end

  # GET /companies/:id/questions
  # requires: company exists with given id
  # effects: returns offer question page
  def question
    @company = Company.find(params[:id])
    @questions = @company.questions.all
    @current_user = @current_user
  end

  # GET /companies/new
  # requires: user logged in
  # modifies: Company table
  # effects: returns new company form
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  # requires: user logged in as admin
  # effects: returns company edit form
  def edit
    admin()
    @company = Company.find(params[:id])
  end

  # POST /companies
  # requires: company attributes valid
  # modifies: Company table
  # effects: new company created and redirect to company landing page
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
  # requires: logged in as admin
  # modifies: Company table
  # effects: company attributes updated and redirect to company landing page
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
  # requires: logged in as admin
  # modifies: Company table
  # effects: company destroyed
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

end
