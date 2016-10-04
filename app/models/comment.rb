class Comment
  include Mongoid::Document
  include Mongoid::Timestamps::Short # For c_at and u_at.
  
    field :text, type: String
    field :love, type: Integer
    
    belongs_to :post, index: true
    belongs_to :user, index: true

    validates :post_id, presence: true
    validates :user_id, presence: true

end
