class LinksController  < ApplicationController
  def index
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(model_params)

    if @link.save
      redirect_to @link
    else
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  private
  def model_params
    params.require(:link).permit(:title, :url)
  end

end
