class PrototypesController < ApplicationController
  before_action :move_to_login, except: [:index, :show]
  before_action :move_to_top, only:[:edit]
  def index
    @prototypes = Prototype.includes(:user)
  end
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(params_parameter)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
  end 

  def edit
    @prototype = Prototype.find(params[:id])
    
  end 

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(params_parameter)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end
  
  private
  def params_parameter
    params.require(:prototype).permit(:title,:catch_copy,:concept,:image).merge(user_id:current_user.id)
  end

  def move_to_login
    unless authenticate_user!
      redirect_to new_user_session_path
    end
  end

  def move_to_top
    unless current_user.id == Prototype.find(params[:id]).user.id
      redirect_to root_path
    end
  end
end
