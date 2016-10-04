module Loveable
  extend ActiveSupport::Concern
  included do
    field :love_users, type: Array #store id of users who love this post
    field :total_love
    attr_accessor :is_loved
  end

  ## for love button ##
  #####################

  def toggle_love(current_user_id)
    love_users = self.love_users || []
    total_love = self.total_love || 0
    @is_loved = false

    # Update love users list
    idx = love_users.index(current_user_id)
    if idx.nil?
      love_users << current_user_id
      total_love = total_love + 1
      @is_loved = true
    else
      love_users.delete_at(idx)
      total_love = total_love - 1
      @is_loved = false
    end

    self.update_attributes({:love_users => love_users, :total_love => total_love})
  end

end