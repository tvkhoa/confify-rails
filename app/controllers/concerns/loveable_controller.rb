module LoveableController
  def toggle_love_by_user(instance_object, current_user_id)
    if instance_object.present? and instance_object.toggle_love(current_user_id)
      # Success: TO-DO   
    else
      # TO-DO 
    end
  end

end