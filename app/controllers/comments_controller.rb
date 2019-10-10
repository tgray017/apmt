class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      @ticket = Ticket.find(params[:comment][:ticket_id])
      redirect_to ticket_path(@ticket)
    else
      render 'tickets/show' # set a flash message - user or ticket doesn't exist
    end
  end


  private

    def comment_params
      params.require(:comment).permit(:ticket_id, :content)
    end
end
