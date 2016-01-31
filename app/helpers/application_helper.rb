module ApplicationHelper
  def gravatar_for(user, options = { size:80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end

  def likes_total(message)
    message.get_likes.by_type(User).size
  end
  def dislikes_total(message)
    message.get_dislikes.by_type(User).size
  end
  def likes_dislikes_total(user, message)
    likes_total(message) + dislikes_total(message)
  end
  def followers_total(follower, followed)
    user.votes_for.up.by_type(User)
  end
  def following_total(user)
    user.votes.up.by_type(User)
  end


  def likes?(message)
    return current_user.voted_up_on? message
  end

  def dislikes?(message)
    return current_user.voted_down_on? message
  end

  def follows?(user)
    return current_user.voted_up_on? user
  end

  def followers_messages
    current_user.votes.up.by_type(Message)
  end
end
