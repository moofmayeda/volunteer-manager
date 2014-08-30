class EventsController < ApplicationController
  before_filter :authorize, except: :index

  def index
    @events = Event.all
    @volunteers = Volunteer.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event created!"
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      @event.volunteers << Volunteer.find(params[:event][:volunteer_ids].first)
      flash[:notice] = "Event updated!"
      redirect_to event_path(@event)
    else
      render 'show'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.volunteers.destroy
    @event.destroy
    redirect_to events_path
  end

private
  def event_params
    params.require(:event).permit(:name, :location, :date)
  end
end
