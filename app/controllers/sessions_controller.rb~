class SessionsController < ApplicationController

	def create
	  flash[:notice] = ''
	  user = User.find(:first, :conditions => {:email => params[:email]})

	  #Check for redundant Usernames
	  if user
	    flash[:notice] = 'Account with that email address already exists'
	    render 'static_pages/register'

	  #Check Password confirmation
	  elsif params[:password] != params[:confirm_password]
	    flash[:notice] = 'Passwords do not match'
	    render 'static_pages/register'

	  #Must be MIT-affiliated e-mail address
	  elsif params[:email][-7,7] != 'mit.edu'
	    flash[:notice] = 'Must register with an MIT email address'
	    render 'static_pages/register'

	  #Valid Username and Password Combination
	  else
	    user = User.create(:email => params[:email], :password => params[:password], :activated => 0, :serial => SecureRandom.hex(10))
	    send_email(user)
	    render 'static_pages/emailed'
	  end
        end
	
	#Send email to for account activation to verify MIT-affiliation for users
	def send_email(user)
	  UserMailer.activate_email(user).deliver
	end

	def login
	  user = User.find(:first, :conditions => {:email => params[:email]})
	  
	  #Account not activated
	  if user && !user.activated
	    flash[:notice] = 'Account is not yet activated'
	    redirect_to '/login'

	  #Admin Login
	  elsif params[:email] == "Admin"

	    #Verify Credentials
	    if user && user[:password] == params[:password]
	      session[:user_id] = user.id
	      flash[:notice] = 'Successfully logged in as Administrator'
	      redirect_to '/'

	    #First Time Admin login
	    elsif user== nil && params[:password] == "6170fun"
 	      user = User.create(:email => "Admin", :password =>"6170fun", :activated => 1, :serial => SecureRandom.hex(10))
	      session[:user_id] = user.id
	      flash[:notice] = 'Successfully logged in as Administrator'
	      redirect_to '/'

            else
    	      flash[:notice] = 'Invalid username or password'
	      redirect_to '/login'
	    end

	  #Successful Login (non-admin)
	  elsif user && user[:password] == params[:password]
	    session[:user_id] = user.id
            if flash[:notice] == ''
	      flash[:notice] = 'Successfully logged in'
	    end
	    redirect_to '/'

	  else
	    flash[:notice] = 'Invalid username or password'
            redirect_to '/login'
	  end
	end

	def activate
	  user = User.find(:first, :conditions => {:serial => params[:serial]})
	  
	  #Successful activation link, set User account as activated and login user
	  if user && !user.activated
	    User.update(user.id, :activated => 1)
	    flash[:notice] = 'Successfully activated and logged in'
	    session[:user_id] = user.id
	    redirect_to :root

	  #Invalid activation
	  elsif
	    flash[:notice] = 'Invalid or expired link'
	    redirect_to :root
	  end

	end

	def deactivate
	  user = User.find(:first, :conditions => {:serial => params[:serial]})
	  User.destroy(user.id)
	  flash[:notice] = 'Account successfully destroyed'
	  redirect_to :root
	  end

	end

	def destroy
	  session[:user_id] = nil
	  flash[:notice] = 'Successfully logged out'
	  redirect_to root_url
	end

end

