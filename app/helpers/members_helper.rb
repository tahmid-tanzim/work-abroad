module MembersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(member, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(member.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: member.national_id, class: "gravatar")
  end
end
