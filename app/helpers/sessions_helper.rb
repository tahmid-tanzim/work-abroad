module SessionsHelper

  # Logs in the given member.
  def log_in(member)
    session[:member_id] = member.id
  end

  # Remembers a member in a persistent session.
  def remember(member)
    member.remember
    cookies.permanent.signed[:member_id] = member.id
    cookies.permanent[:remember_token] = member.remember_token
  end

  # Returns the current logged-in member (if any).
  def current_member
    if (member_id = session[:member_id])
      @current_member ||= Member.find_by(id: session[:member_id])
    elsif (member_id = cookies.signed[:member_id])
      member = Member.find_by(id: member_id)
      if member && member.authenticated?(cookies[:remember_token])
        log_in member
        @current_member = member
      end
    end
  end

  # Forgets a persistent session.
  def forget(member)
    member.forget
    cookies.delete(:member_id)
    cookies.delete(:remember_token)
  end

  # Returns true if the member is logged in, false otherwise.
  def logged_in?
    !current_member.nil?
  end

  # Logs out the current member.
  def log_out
    forget(current_member)
    session.delete(:member_id)
    @current_member = nil
  end
end
