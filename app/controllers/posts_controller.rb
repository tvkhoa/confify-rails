class PostsController < ApplicationController
  include LoveableController
  before_filter :authenticate_user! , :except => [:show]
  
  ## POST /love_post
  ## params: post_id

  def toggle_love
    @post = Post.find(love_params[:post_id])

    @post_decorator = PostDecorator.new
    @post_decorator.setPost(@post)

    toggle_love_by_user(@post, current_user._id)

    respond_to do |format|
      format.js {}
    end

  end



  def add_comment
    @post_id = comment_params[:post_id]
    @comment = comment_params[:comment]
    post = Post.find(@post_id)
    
    unless post.nil?
      if post.build_comment(current_user._id, @comment)
        # TO-DO
      else
        # TO-DO
      end
    end

    respond_to do |format|
      format.js {}
    end

  end

  def show
    @post = Post.find(params[:id])
    
    @post_decorator = PostDecorator.new
    @post_decorator.setPost(@post)

    respond_to do |format|
      format.html # show.html.erb
    end
  end


  private
  def love_params
    params.permit(:post_id)
  end

  def comment_params
    params.permit(:post_id, :user_id, :comment)
  end

  

end
