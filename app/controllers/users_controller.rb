class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @prototype = @user.prototypes
  end
end
