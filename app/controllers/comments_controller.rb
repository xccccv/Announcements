class CommentsController < ApplicationController
  
  def new 
    @comment = Announcement.find(announce_id).comments.new(:user_id => getUserId)
  end

  def create 
    @comment = Comment.new(comment_params)
    if @comment.save 
      flash[:notice] = "Comment created successfully."
      redirect_to(announcement_path(@comment.announcement_id))
    else 
      render('new')
    end
  end

  def delete 
    @comment = Comment.find(params[:id])
  end

  def destroy
    announceId = Comment.find(params[:id]).announcement_id
    if Comment.find(params[:id]).destroy
      flash[:notice] = "Comment deleted successfully."
      redirect_to(announcement_path(announceId))
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:user_id, :comment, :announcement_id)
  end

  def announce_id 
    params["format"]
  end

end
