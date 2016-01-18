class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def exist_file
    @yml_exist = File.exist?("config/settings.local.yml")
  end
end