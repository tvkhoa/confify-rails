class PostDecorator
  attr_reader :post

  def initialize
  end

  def setPost(post)
    @post = post
  end


  def confession_pathname
    post.confession.path_name
  end

  def total_love_users
    post.love_users.count
  end

  def total_comments
    post.comments.count
  end

  def love_form_id
    post._id.to_s + "_love_form"
  end

  def comment_form_id
    post._id.to_s + "_comment_form"
  end

  def love_submit_id
    post._id.to_s + "_love_submit"
  end

  def comment_post_id
    "comment-posts-" + post._id.to_s
  end


  def is_love?(current_user_id)
    post.love_users.include? current_user_id
  end

  def love_classes(current_user_id)
    classes = ['love-button']
    classes << 'love-active' if is_love?(current_user_id)
    classes.join(" ")
  end

  def three_last_comments
    post.comments.desc(:u_at).take(3) || []
  end

  def is_comments_more_than?(number_of_comments)
    post.comments.count > 3
  end

  def method_missing (method_name, *args, &block)
    post.send(method_name, *args, &block)
  end

  def respond_to_missing? (method_name, include_private = false)
    post.respond_to?(method_name, include_private) || super
  end



end