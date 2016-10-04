class Admin::ConfessionsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!

  # GET /confessions
  # GET /confessions.json
  def index
    @confessions = Confession.where(:user_id => current_user._id)
    respond_to do |format|
      format.html # index.html.erb
    end
  end


  def manage
    @confession = Confession.find_by_pathname_and_user(params[:path_name], current_user._id)
    @posts = Post.where(:confession_id => @confession._id)
    @approved_posts = []
    @not_approved_posts = []
    @posts.each do |post|
      if post.approved == true
        @approved_posts << post
      else
        @not_approved_posts << post
      end
    end
    respond_to do |format|
      format.html
    end
  end

  # GET /confessions/new
  # GET /confessions/new.json
  def new
    @confession = Confession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @confession }
    end
  end

  # GET /confessions/1/edit
  def edit
    @confession = Confession.find(params[:id])
  end

  # POST /confessions
  # POST /confessions.json
  def create
    @confession = Confession.new(confession_params)
    @confession.user = current_user

    respond_to do |format|
      if @confession.save
        format.html { redirect_to admin_root_path, notice: 'Confession was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PATCH/PUT /confessions/1
  # PATCH/PUT /confessions/1.json
  def update
    @confession = Confession.find(params[:id])

    respond_to do |format|
      if @confession.update_attributes(confession_params)
        format.html { redirect_to admin_root_path, notice: 'Confession was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @confession.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /confessions/1
  # DELETE /confessions/1.json
  def destroy
    @confession = Confession.find(params[:id])
    @confession.destroy

    respond_to do |format|
      format.html { redirect_to admin_confessions_url }
      format.json { head :no_content }
    end
  end

  private

    def confession_params
      main_param = params.require(:confession).permit(:title, :text, :path_name);
    end


end
