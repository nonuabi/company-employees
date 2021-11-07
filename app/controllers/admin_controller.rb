class AdminController < ApplicationController
  def login
    if request.post?
      if params[:username]==="admin" && params[:password]==="password"
        session[:admin] = :admin
        redirect_to :controller=> :developers
      else 
        flash[:notice] = "Invalid username/password"
        render :action => :login
      end
    end
  end

  def logout
    session[:admin] = nil
    flash[:notice] = "You'r logged out"
    redirect_to :action=>:login
  end
end
