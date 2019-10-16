class StatusesController < ApplicationController

  def show
    @status = Status.find_by(:id => params[:id])
    if @status
      @tickets = Ticket.where(:status_id => @status.id)
    else
      redirect_to root_path, :flash => {:alert => "Status does not exist."}
    end
  end

  def new
    @status = Status.new
  end

  def create
    @status = authorize Status.new(status_params)
    if @status.save
      redirect_to status_path(@status)
    else
      render :new #set a flash message
    end
  end

  def update
    @status = Status.find_by(:id => params[:id])
    if @status
      authorize @status

    else
      redirect_to root_path, :flash => {:alert => "Status does not exist."}
    end
  end

  private

    def status_params
      params.require(:status).permit(:name, :description)
    end
end
