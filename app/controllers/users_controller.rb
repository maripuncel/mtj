class UsersController < ApplicationController

  def check_admin
    is_admin = admin()
    if !is_admin
      flash[:notice] = 'You must be an administrator to access this page.'
      redirect_to('/')
    end
    return is_admin
  end

  def check_logged_in
    is_logged_in = current_user()
    if !is_logged_in
      flash[:notice] = 'You must log in to view that page'
      redirect_to('/login')
    end
    return is_logged_in
  end

  # GET /users
  # GET /users.json
  def index
    if !check_admin()
      return
    end
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if !check_admin()
      return
    end
    @user ||= User.find(params[:id]) if params[:id]
    if !@user
      redirect_to '/', notice: 'User does not exist.'
      return
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def change_password
    if !check_logged_in()
      return
    end
    if @current_user.password == params[:old_password]
      if params[:new_password] == params[:confirm_new_password]
	@current_user.change_password(params[:new_password])
        flash[:notice] = 'Password Changed Successfully'
      else
        flash[:notice] = 'New Passwords do not match'
      end
    else
      flash[:notice] = 'Invalid Password'
    end
    redirect_to '/'
  end
  
  # GET /users/new
  # GET /users/new.json
  def new
    if !check_admin()
      return
    end
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    if !check_admin()
      return
    end
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    if !check_admin()
      return
    end
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
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
    if !check_admin()
      return
    end
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
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
    if !check_admin()
      return
    end
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
