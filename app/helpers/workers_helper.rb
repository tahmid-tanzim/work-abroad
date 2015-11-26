module WorkersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(worker, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(worker.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: worker.national_id, class: "gravatar")
  end
end
