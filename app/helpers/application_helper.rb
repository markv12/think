module ApplicationHelper
  def sanitaze(text)
    text.gsub(/(<.*?>)/, '')
  end

  def newline_to_br(text)
    sanitaze(text).gsub(/\n/, '<br />').html_safe
  end
end
