module ApplicationHelper

  def my_sanitize(str)
    sanitize(str.to_s.gsub(/\r\n/,"<br>").gsub(/\n/,"<br>"), tags: %w(br strong em b i ul li))
  end
end
