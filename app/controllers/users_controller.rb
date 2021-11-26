class UsersController < ApplicationController
      
      def new
        @user = User.new
      end
    
      def create
        User.create(user_params) # POINT
        redirect_to "/"
      end
      
      def show
        @user = User.find(params[:id])
        @name = @user.name
        @arts = @user.arts
      end
      
      private 
      
      def user_params
           params.require(:user).permit(:name)
      end
    
end
