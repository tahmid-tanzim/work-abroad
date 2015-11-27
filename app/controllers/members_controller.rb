class MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
    # debugger
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)    # Not the final implementation!
    if @member.save
      log_in @member
      flash[:success] = "Welcome to the Work Abroad!"
      redirect_to @member
    else
      render 'new'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      flash[:success] = "Profile updated"
      redirect_to @member
    else
      render 'edit'
    end
  end

  private

  def member_params
    params.require(:member).permit(:fullname, :national_id, :email, :password, :password_confirmation)
  end
end