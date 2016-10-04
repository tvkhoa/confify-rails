class Post
  include Mongoid::Document
  include Loveable
  include Approveable

  field :title, type: String
  field :text, type: String
  field :email_sender, type: String
  
  field :answer, type: String

  field :watch, type: Integer
  field :index, type: Integer
  

  # Relationship #
  ################

  belongs_to :confession
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments

  # callback #
  ############

  after_build :set_default_value

  def build_comment(current_user_id, comment)
    comment_post = self.comments.build({:text => comment, :user_id => current_user_id})
    comment_post.save
  end


  protected

  # Set default value when create #
  #################################
  def set_default_value
    self.answer = ""
    self.approved = false
    self.watch = 0
    self.love_users = []
  end





end
