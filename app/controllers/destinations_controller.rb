class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
    @posts = @destination.posts.sort{|h, l| l.created_at <=> h.created_at}[0..4]
    @most_likes = @destination.posts.max_by{|p| p.likes}
    @average_age = @destination.average_age
  end
end
