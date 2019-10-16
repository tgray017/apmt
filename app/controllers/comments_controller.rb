class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @ticket = Ticket.find(params[:comment][:ticket_id])
    if @comment.save
      redirect_to ticket_path(@ticket)
    else
      redirect_to ticket_path(@ticket), :flash => {:alert => "Invalid comment."}
    end
  end


  private

    def comment_params
      params.require(:comment).permit(:ticket_id, :content)
    end
end
