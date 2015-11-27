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
      log_in @worker
      flash[:success] = "Welcome to the Work Abroad!"
      redirect_to @worker
    else
      render 'new'
    end
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update_attributes(worker_params)
      flash[:success] = "Profile updated"
      redirect_to @worker
    else
      render 'edit'
    end
  end

  private

  def worker_params
    params.require(:worker).permit(:fullname, :national_id, :email, :password, :password_confirmation)
  end
end
