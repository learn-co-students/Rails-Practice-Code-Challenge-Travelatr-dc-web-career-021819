class BloggersController < ApplicationController

  def index
    @bloggers = Blogger.all
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.save
      redirect_to
    else
      render :new
    end
  end

  def show
    @blogger = Blogger.find(params[:id])
    @posts = @blogger.posts.sort{|high, low| low.likes <=> high.likes}[0..4]
  end

  private
  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end
end
