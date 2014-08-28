class ActionsController < ApplicationController
  def index
    @actions = Action.all
  end

  def new
    @action = Action.new
  end

  def create
    @action = Action.new(action_params)
    if @action.save
      flash[:notice] = "Action created!"
      redirect_to action_path
    else
      render 'new'
    end
  end

  def show
    @action = Action.find(params[:id])
  end

private
  def action_params
    params.require(:action).permit(:name, :location, :date)
  end
end
