class SessionsController < ApplicationController
  def new
  end

  def create
    organizer = Organizer.find_by_name(params[:name])
    if organizer && organizer.authenticate(params[:password])
      session[:organizer_id] = organizer.id
      flash[:notice] = "Logged in!"
      redirect_to root_path
    else
      flash.now.alert = "Password is invalid."
      render 'new'
    end
  end

  def destroy
    session[:organizer_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_path
  end
end
