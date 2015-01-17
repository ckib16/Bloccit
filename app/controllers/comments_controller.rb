class CommentsController < ApplicationController
  
  respond_to :html, :js

  # def new
  #   @topic = Topic.find(params[:topic_id])
  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.new
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments
    @new_comment = Comment.new

    @comment = current_user.comments.build( comment_params ) #Associate comment w/ current user
    @comment.post = @post #Associate the comment to a post

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was created."      
    else
      flash[:error] = "There was an error saving the comment."
    end
    
    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was deleted successfully"
    else
      flash[:error] = "There was an error deleting the comment."
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end
  end

  private

  def comment_params
    params.require(:comment).permit (:body)
  end

end
