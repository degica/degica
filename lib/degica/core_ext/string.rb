class String
  def highlight(color = :yellow)
    gsub(/\(([A-Za-z\s]+)\)/m, "#{Degica::ANSI.highlight('\1', color)}")
  end
end
