class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      'login'
    else
      'application'
    end
  end
end
