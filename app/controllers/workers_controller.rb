class WorkersController < ApplicationController

  def show
    @worker = Worker.find(params[:id])
    # debugger
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)    # Not the final implementation!
    if @worker.save
      flash[:success] = "Welcome to the Work Abroad!"
      redirect_to @worker
    else
      render 'new'
    end
  end

  private

  def worker_params
    params.require(:worker).permit(:fullname, :national_id, :email, :password, :password_confirmation)
  end
end
