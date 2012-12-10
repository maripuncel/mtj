class UsersController < ApplicationController

  def check_logged_in
    is_logged_in = current_user()
    if !is_logged_in
      flash[:notice] = 'You must log in to view that page'
      redirect_to('/login')
    end
    return is_logged_in
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

end
