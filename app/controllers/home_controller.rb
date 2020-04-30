class HomeController < ApplicationController
  before_action :auth_required

  def index
  	render :layout => 'org'
  end
end
