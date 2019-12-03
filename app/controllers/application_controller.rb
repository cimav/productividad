class ApplicationController < ActionController::Base

  include ApplicationHelper

  def auth_required
    redirect_to '/login' unless authenticated?
  end

end
