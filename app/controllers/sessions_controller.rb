class SessionsController < ApplicationController
  def new
  end

  def create
    worker = Worker.find_by(email: params[:session][:email].downcase)
    if worker && worker.authenticate(params[:session][:password])
      log_in worker
      params[:session][:remember_me] == '1' ? remember(worker) : forget(worker)
      redirect_to worker
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
