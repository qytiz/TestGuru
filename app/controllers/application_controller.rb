# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    attributes = %i[first_name last_name]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      if stored_location_for(resource)=='/'
        admin_tests_path
      else
        stored_location_for(resource)
      end
    else
    stored_location_for(resource)
    super
    end
  end
end
