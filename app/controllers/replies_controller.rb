class RepliesController < ApplicationController

  def create
    @comment = Comment.find(params[:reply][:comment_id])
    @reply = @comment.replies.build(:content => params[:reply][:content], :user => current_user, :comment => @comment)
    if @reply.save
      redirect_to ticket_path(@comment.ticket)
    else
      render ticket_path(@comment.ticket)
    end
  end

  #private

    #def reply_params
    #  params.require(:reply).permit(:comment_id, :content)
    #end
end
