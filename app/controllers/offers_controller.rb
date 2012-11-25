class OffersController < ApplicationController
  before_filter :check_status

  def check_status
    if !current_user()
      flash.now[:notice] = 'You must log in to view that page'
      render "static_pages/login"
    end
  end


  # GET /offers/1/edit
  def edit
    @offer = Offer.find(params[:id])
    if @offer.user_id != @current_user.id
      flash[:notice] = 'You don\'t have permission to edit this data.'
      redirect_to 'http://localhost:3000/companies/' + params[:id] + '/offers'
    end
  end

  # POST /offers
  # POST /offers.json
  def create
    Offer.add_offer(params, @current_user)
    render :text => 'http://localhost:3000/companies/' + params[:company] + '/offers'
  end

  # PUT /offers/1
  # PUT /offers/1.json
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
  # DELETE /offers/1.json
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to offers_url }
      format.json { head :no_content }
    end
  end
end
