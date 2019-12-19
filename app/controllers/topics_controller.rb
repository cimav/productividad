class TopicsController < ApplicationController
  def search
    @topics = Topic.select("id AS id, name AS label, name AS value").where("name LIKE :query", query: "%#{params[:term]}%")
    render json: @topics
  end
end
