class MembersController < ApplicationController
  before_action :logged_in_member, only: [:edit, :update]
  before_action :correct_member,   only: [:edit, :update]

  def index
    @members = Member.paginate(page: params[:page])
  end

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

  # Before filters

  # Confirms a logged-in member.
  def logged_in_member
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct member.
  def correct_member
    @member = Member.find(params[:id])
    redirect_to(root_url) unless current_member?(@member)
  end
end
