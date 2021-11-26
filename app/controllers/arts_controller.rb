class ArtsController < ApplicationController
  def index 
    @arts = Art.all
    @users = User.all
  end
  
  def new
    @art = Art.new
    @user = User.find(params[:user_id])
  end

  def create
    art = Art.create(art_params) # POINT
    redirect_to "/users/#{art.user.id}"
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
       params.require(:art).permit(:content, :image, :grade, :title).merge(user_id: params[:user_id])
  end
 end
