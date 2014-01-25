class CommentsController < ApplicationController
  def create
    @issue = Issue.find(params[:issue_id])
    @comment = @issue.comments.build(user_id: current_user.id, content: comment_params[:content])

    if @comment.save
      redirect_to @comment.issue
    else
      redirect_to @issue, notice: 'Add comment error!'
    end
  end

  private
   def comment_params
     params.require(:comment).permit!
   end
end
