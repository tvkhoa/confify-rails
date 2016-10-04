class Confession
  include Mongoid::Document
  include Loveable

  field :title, type: String
  field :text, type: String
  field :path_name, type: String
  
  # mount_uploader :banner, ImageUploader

  # Relationship #
  ################

  has_many :posts, dependent: :destroy
  belongs_to :user, index: true
  accepts_nested_attributes_for :posts

  #validate
  validates_presence_of :title, :path_name
  validates_uniqueness_of :path_name

  before_create :set_default_value


  def get_by_index(search_index)
    self.posts.approved.where(:index => search_index)
  end

  def get_by_newest(offset, limit)
    self.posts.approved.desc(:index).skip(offset).limit(limit)
  end

  def get_by_hottest(offset, limit)
    self.posts.approved.desc(:total_love).skip(offset).limit(limit)
  end

  protected


  def self.find_by_pathname(pathname)
    self.where(:path_name => pathname).first
  end

  def self.find_by_pathname_and_user(pathname, user_id)
    self.where(:path_name => pathname, :user_id => user_id).first
  end

  def set_default_value
    self.love_users = []
  end
 
end
