class Admin::PostsController < ApplicationController
  layout "admin"
  before_filter :authorize_actions

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_path(@post.confession.path_name)  }
    end
  end


  def update_approve
    @post = Post.find(params[:post_id])
    
    if @post.present? and @post.set_approve(params[:is_previous_approve])
      # Success: TO-DO
    end

    respond_to do |format|
      format.js {}
    end
  end


  def update_answer
    @post = Post.find(params[:post_id])
    
    if @post.present? and @post.update_attributes(:answer => params[:answer])
      # Success: TO-DO  
    end

    respond_to do |format|
      format.js {}
    end
  end

  private
    ##
    # Authorize user
    def authorize_actions
      unless user_signed_in?
        @is_admin = true;
      else
        @is_admin = false;
      end
    end
end
