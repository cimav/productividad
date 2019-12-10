class ActivityLogsController < ApplicationController
  def ui
    @product = eval("#{params[:product_class]}.find(#{params[:product_id]})")
    render layout: false
  end
end
