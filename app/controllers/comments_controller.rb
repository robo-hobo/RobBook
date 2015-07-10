class CommentsController < ApplicationController

  def create
    @comment_new = current_user.comments.build(comment_params)
    @comment_new.post_id = params[:post_id]
    if @comment_new.content == ""
      redirect_to '/' 
    elsif @comment_new.save 
      redirect_to '/' 
    else 
      render '/' 
    end 
  end

  private 
    def comment_params 
    	params.require(:comment).permit(:content) 
    end

end
