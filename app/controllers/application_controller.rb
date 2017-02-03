class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def authenticate_user!
    if not user_signed_in?
      redirect_to new_user_session_path, :notice => 'You must be logged in to perform that action'
    end
  end
end
