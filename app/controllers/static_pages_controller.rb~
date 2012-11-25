class StaticPagesController < ApplicationController
  def home
    current_user()
  end

  def register
    redirect_if_logged_in()
  end

  def login
    redirect_if_logged_in()
  end

  def redirect_if_logged_in()
    if current_user()
      flash[:notice] = 'Already logged in'
      redirect_to :controller => 'companies', :action => 'index'
    end
  end

end
