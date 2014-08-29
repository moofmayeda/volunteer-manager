class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def authorize
    if current_organizer.nil?
      flash[:alert] = "Not authorized"
      redirect_to root_path
    end
  end

  def current_organizer
    @current_organizer ||= Organizer.find(session[:organizer_id]) if session[:organizer_id]
  end
  helper_method :current_organizer
end
