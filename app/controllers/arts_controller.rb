class ArtsController < ApplicationController
  def index 
    @arts = Art.all
  end
  
  def new
    @art = Art.new
  end

  def create
    Art.create(art_params) # POINT
    redirect_to "/"
  end

  def show
    @art = Art.find(params[:id])
  end

  def edit
    @art = Art.find(params[:id]) 
  end

  def update
    art = Art.find(params[:id])
    art.update(art_params) # POINT
    redirect_to "/"
  end
  
  private 
  
  def art_params
       params.require(:art).permit(:content, :image, :grade, :title)
  end
 end
