class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    admin()
    current_user()
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    current_user()
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def changepass
    
    @user = User.find(:first, :conditions => {:email => params[:email]})
    if @user == nil
	flash[:notice] = 'No such user'
        render edit_user_path(@user)
    end

    if @user[:password] == params[:old_password]
      if params[:new_password] == params[:confirm_new_password]
	@user.change_password(params[:new_password])
        flash[:notice] = 'Password Changed Successfully'
        render 'static_pages/login'

      else
        flash[:notice] = 'New Passwords do not match'
        render 'static_pages/login'
      end

    else
      flash[:notice] = 'Invalid Password'
      render 'static_pages/login'
    end
    
  end
  
  # GET /users/new
  # GET /users/new.json
  def new
    admin()
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    admin()
    current_user()
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
