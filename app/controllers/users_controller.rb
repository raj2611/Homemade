class UsersController < ApplicationController
before_action :authenticate_user!
  def index
    @users = User.all.paginate(page: params[:page],per_page: 4) 

 
  end
  def show
  	@user = User.find(params[:id])
  	@contents=@user.contents.paginate(page: params[:page],per_page: 2)
  end
  
end