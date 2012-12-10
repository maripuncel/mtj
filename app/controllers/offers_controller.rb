class OffersController < ApplicationController
  before_filter :check_status

  # GET /offers/1/edit
  # requires: logged in as admin
  # effects: returns offer edit page
  def edit
    @offer = Offer.find(params[:id])
    if @offer.user_id != @current_user.id
      flash[:notice] = 'You don\'t have permission to edit this data.'
      redirect_to 'http://localhost:3000/companies/' + params[:id] + '/offers'
    end
  end

  # POST /offers
  # requires: user logged in and valid offer attributes
  # modifies: Offer table
  # effects: creates new offer and redirects to company offer page
  def create
    Offer.add_offer(params, @current_user)
    redirect_to :back
  end

  # PUT /offers/1
  # requires: logged in as admin and offer exists with given id
  # modifies: Offer table
  # effects: updates offer with given attributes
  def update
    @offer = Offer.find(params[:id])

    respond_to do |format|
      if @offer.update_attributes(params[:offer])
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # requires: logged in as admin and offer exists with given id
  # modifies: Offer table
  # effects: update destroyed
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to offers_url }
      format.json { head :no_content }
    end
  end
end
