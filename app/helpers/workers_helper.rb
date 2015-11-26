module WorkersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(worker)
    gravatar_id = Digest::MD5::hexdigest(worker.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: worker.national_id, class: "gravatar")
  end
end
