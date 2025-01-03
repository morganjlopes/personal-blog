module ApplicationHelper

  def format_date(datetime)
    datetime.strftime("%b %d, %Y")
  end
end
