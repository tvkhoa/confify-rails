module Approveable
  extend ActiveSupport::Concern
  included do
    field :approved, type: Boolean

    # Scope #
    #########
    scope :approved, ->{ where(approved: true) }
    scope :not_approved, ->{ where(approved: false) }

  end

  ## for approved button ##
  #########################
  
  def set_approve (is_previous_approve)
    if is_previous_approve.present?
      @param = { :approved => false }
    else
      @param = { :approved => true }
    end
    self.update_attributes(@param)
  end
  
  def toggle_approve
    @param = { :approved => !self.approved }
    if !self.approved and self.index.nil?
      @param.merge!(self.update_index)
    end

    self.update_attributes(@param)
    
  end

  def update_index
    @last_post = Post.where(:index.ne => nil, confession_id: self.confession_id).desc(:index).first
    @index = @last_post ? @last_post.index : 0

    return {:index => @index + 1}
  end

end