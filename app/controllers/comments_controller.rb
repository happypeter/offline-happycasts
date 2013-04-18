class CommentsController < ApplicationController
  before_filter :have_logined_user

  def index
    @event = Event.find(params[:event_id])
    redirect_to @event
  end

  def create
    user = current_user
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(user_id: user.id, content: params[:comment][:content])

    if @comment.save
      redirect_to @comment.event
    else
      redirect_to @event, notice: 'Add comment error!'
    end
  end

end
