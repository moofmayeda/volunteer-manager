class OrganizersController < ApplicationController

  def new
    @organizer = Organizer.new
  end

  def create
    @organizer = Organizer.new(organizer_params)
    if @organizer.save
      flash[:notice] = "Welcome to the team!"
      redirect_to events_path
    else
      render 'new'
    end
  end

private
  def organizer_params
    params.require(:organizer).permit(:name, :password, :password_confirmation)
  end
end
