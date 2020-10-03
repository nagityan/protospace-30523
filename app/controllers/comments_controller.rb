class CommentsController < ApplicationController
  def create
    # binding.pry
    @comment = Comment.new(params_parameter)
    if @comment.save
      redirect_to prototype_path(@comment.prototype.id)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end

  private
  def params_parameter
    params.require(:comment).permit(:text).merge(user_id:current_user.id,prototype_id:params[:prototype_id])
  end
end
