module ApplicationHelper

  def display_shop_time(dt)
#    dt = dt.in_time_zone(current_user.time_zone) if logged_in?
    dt.strftime("%I:%M%P")
  end

  def display_shop_date(dt)
    dt.strftime("%A, %b %d, %Y")
  end

end
