# Comments controller
class CommentsController < ApplicationController
  before_filter :authenticate_user!

  # Creates a new comment for a startup
  def create
    comment = Comment.new(comment_params)
    comment.startup = Startup.find(params[:startup_id])
    comment.user = current_user
    comment.save!

    redirect_to comment.startup
  end

  private

  # Needed params for all operations
  def comment_params
    params.require(:comment).permit(:text)
  end
end
