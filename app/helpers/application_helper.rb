module ApplicationHelper
  def format_date(date)
    date.strftime("%a, %B %-d, %Y")
  end
end
