class SessionsController < ApplicationController

	def create
	  flash[:notice] = ''
	  user = User.find(:first, :conditions => {:email => params[:email]})
	  if user
	    flash[:notice] = 'Account with that email address already exists'
	    render 'static_pages/register'	
	  elsif params[:password] != params[:confirm_password]
	    flash[:notice] = 'Passwords do not match'
	    render 'static_pages/register'
	  elsif params[:email][-7,7] != 'mit.edu'
	    flash[:notice] = 'Must register with an MIT email address'
	    render 'static_pages/register'
	  else
	    user = User.create(:email => params[:email], :password => params[:password], :activated => 0, :serial => SecureRandom.hex(10))
	    send_email(user)
	    render 'static_pages/emailed'
	  end
        end

	def send_email(user)
	  UserMailer.activate_email(user).deliver
	end

	def login
	  user = User.find(:first, :conditions => {:email => params[:email]})
	  if user && !user.activated
	    flash[:notice] = 'Account is not yet activated'
	    redirect_to '/login'
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
	  if user && !user.activated
	    User.update(user.id, :activated => 1)
	    flash[:notice] = 'Successfully activated and logged in'
	    session[:user_id] = user.id
	    redirect_to :root
	  elsif
	    flash[:notice] = 'Invalid or expired link'
	    redirect_to :root
	  end
	end

	def destroy
	  session[:user_id] = nil
	  flash[:notice] = 'Successfully logged out'
	  redirect_to root_url
	end

end

