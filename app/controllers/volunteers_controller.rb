class VolunteersController < ApplicationController
  def index
    @volunteers = Volunteer.all
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      @volunteer.event_ids = params[:volunteer][:event_ids]
      flash[:notice] = "Successfully registered."
      redirect_to volunteer_path(@volunteer)
    else
      render 'new'
    end
  end

  def show
    @volunteer = Volunteer.find(params[:id])
  end

  def update
    @volunteer = Volunteer.find(params[:id])
    if @volunteer.update(volunteer_params)
      @volunteer.event_ids = params[:volunteer][:event_ids]
      flash[:notice] = "Successfully updated."
      redirect_to volunteer_path(@volunteer)
    else
      render 'show'
    end
  end

  def destroy
    @volunteer = Volunteer.find(params[:id])
    @volunteer.destroy
    redirect_to volunteers_path
  end

private
  def volunteer_params
    params.require(:volunteer).permit(:name, :phone, :email)
  end
end
