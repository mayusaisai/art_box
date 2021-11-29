class ArtsController < ApplicationController
  def index 
    @arts = Art.all
    @users = User.all
  end
  
  def new
    @art = Art.new
    @user = User.find(params[:user_id])
    @name = @user.name
  end

  def create
    art = Art.create(art_params) # POINT
    redirect_to "/users/#{art.user.id}"
  end

  def show
    @art = Art.find(params[:id])
  end

  def edit
    @art = Art.find_by(params[:user_id],params[:id])
    
    @user = @art.user
    @name = @user.name
  end

  def update
    art = Art.find_by(params[:user_id],params[:id])
    art.update(art_params) # POINT
    redirect_to "/"
  end
  
  def destroy
    art = Art.find_by(params[:user_id],params[:id])
    art.destroy
    redirect_to "/"
  end
  
  private 
  
  def art_params
       params.require(:art).permit(:content, :image, :grate, :title).merge(user_id: params[:user_id])
  end
 end
