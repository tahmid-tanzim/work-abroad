class WorkersController < ApplicationController

  def show
    @worker = Worker.find(params[:id])
    # debugger
  end

  def new
  end
end
