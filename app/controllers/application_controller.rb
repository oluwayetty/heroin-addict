require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    added_attrs = [:username, :supporter, :goal, :admin, :phone_number]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

end
