class ConfessionsController < ApplicationController
  layout "store"
  
  include LoveableController
  before_filter :authorize_actions
  before_filter :get_post_by_filter , :only => [:show]
  before_filter :get_more_posts , :only => [:view_more]

  # GET /                    #
  # The page for introducing #
  ############################
  def main
    respond_to do |format|
      format.html # index.html.erb
    end
  end


  # GET /path_name                  #
  # The page for showing confession #
  ###################################
  def show
    # for each post
    @post_decorator = PostDecorator.new

    respond_to do |format|
      format.html # show.html.erb
    end
  end


  # PUT confession/:confession_id/add_post
  # Add additional station tests for existing device

  def add_post
    @confession = Confession.find(params[:confession_id])

    if @confession.nil?
      flash[:error] = "Sorry, this post is invalid."
      return
    end

    confession_post = @confession.posts.build(add_post_params)
    if confession_post.save
      flash[:success] = "Sucessfully"
    else
      flash[:error] = "Sorry, this post is invalid."
    end

    respond_to do |format|
      format.html { redirect_to root_path + @confession.path_name }
    end
  end




  ## POST /love_confession
  ## params: confession_id

  def toggle_love
    @confession_id = love_params[:confession_id]
    @confession = Confession.find(@confession_id)

    toggle_love_by_user(@confession, current_user._id)

    respond_to do |format|
      format.js {}
    end
  end


  private
    # for love cofession
    #
    def love_params
      params.permit(:confession_id)
    end


    def confession_params
      main_param = params.require(:confession).permit(:title, :text, :banner, :banner_cache)
    end


    def add_post_params
      main_params = params.require(:confession).permit(:title, :text, :email)
    end

    def get_post_by_filter
      @confession = Confession.find_by_pathname(params[:path_name])
      @approved_posts =
      if params[:by_index]
        @confession.get_by_index( params[:by_index] )
      elsif params[:by_newest]
        @view_more_param = { :by_newest => params[:by_newest].to_i + 20 }
        @confession.get_by_newest( params[:by_newest] , 20 )
        
      elsif params[:by_hottest]
        @view_more_param = { :by_hottest => params[:by_hottest].to_i }
        @confession.get_by_hottest( params[:by_hottest], 20)
      else
        @view_more_param = { :by_newest => params[:by_newest].to_i + 20 }
        @confession.get_by_newest( params[:by_newest] , 20 )  
      end
    end


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
