class IssuesController < ApplicationController
  before_filter :check_login, only: [:new]
  def new
    @issue = Issue.new
  end

  def close
    @issue = Issue.find(params[:id])
    @issue.update_attributes(state: 'closed')
    redirect_to @issue
  end

  def open
    @issue = Issue.find(params[:id])
    @issue.update_attributes(state: 'open')
    redirect_to @issue
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.user_id = current_user.id
    if @issue.save
      redirect_to :root, :notice => "成功"
    else
      render :new
    end
  end

  def show
    @issue = Issue.find(params[:id])
    @comments = @issue.comments.reverse.to_a
    # without to_a @comments.each will produce a empty comment object
  end

  private
   def issue_params
     params.require(:issue).permit!
   end
end
