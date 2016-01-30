module ApplicationHelper
  def gravatar_for(user, options = { size:80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url,alt: user.username,class: "img-circle")
  end

  def likes?(message)
    return current_user.voted_up_on? message
  end
  def dislikes?(message)
    return current_user.voted_down_on? message
  end
end
