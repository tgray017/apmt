class TicketsController < ApplicationController
  def index
    if @user = User.find_by(:id => params[:user_id])
      @tickets = @user.tickets
    else
      @tickets = Ticket.all
    end
  end

  def show
    @ticket = Ticket.find_by(:id => params[:id])
    if @ticket
      @comments = @ticket.comments
      @comment = Comment.new
      @reply = Reply.new
    else
      redirect_to root_path, :flash => {:alert => "Ticket does not exist."}
    end
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render :new # set a flash message
    end
  end

  def edit
    @ticket = Ticket.find_by(:id => params[:id])
    if @ticket
      authorize @ticket
    else
      redirect_to root_path, :flash => {:alert => "Ticket does not exist."}
    end
  end

  def update
    @ticket = Ticket.find_by(:id => params[:id])
    if @ticket
      authorize @ticket
      if @ticket.update(ticket_params)
        redirect_to ticket_path(@ticket)
      else
        render :edit
      end
    else
      redirect_to root_path, :flash => {:alert => "Ticket does not exist."}
    end
  end

  def destroy
    @ticket = Ticket.find_by(:id => params[:id])
    if @ticket
      authorize @ticket
      if @ticket.destroy
        redirect_to tickets_path, :flash => {:alert => "Ticket successfully deleted."}
      else
        redirect_to ticket_path(@ticket)
      end
    else
      redirect_to root_path, :flash => {:alert => "Ticket does not exist."}
    end
  end

  private

    def ticket_params
      params.require(:ticket).permit(:creator_id, :title, :description, :status_id, :assignee_id, :due_date)
    end
end
