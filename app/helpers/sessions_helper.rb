module SessionsHelper

  # Logs in the given worker.
  def log_in(worker)
    session[:worker_id] = worker.id
  end

  # Remembers a worker in a persistent session.
  def remember(worker)
    worker.remember
    cookies.permanent.signed[:worker_id] = worker.id
    cookies.permanent[:remember_token] = worker.remember_token
  end

  # Returns the current logged-in worker (if any).
  def current_worker
    if (worker_id = session[:worker_id])
      @current_worker ||= Worker.find_by(id: session[:worker_id])
    elsif (worker_id = cookies.signed[:worker_id])
      worker = Worker.find_by(id: worker_id)
      if worker && worker.authenticated?(cookies[:remember_token])
        log_in worker
        @current_worker = worker
      end
    end
  end

  # Forgets a persistent session.
  def forget(worker)
    worker.forget
    cookies.delete(:worker_id)
    cookies.delete(:remember_token)
  end

  # Returns true if the worker is logged in, false otherwise.
  def logged_in?
    !current_worker.nil?
  end

  # Logs out the current worker.
  def log_out
    forget(current_worker)
    session.delete(:worker_id)
    @current_worker = nil
  end
end
