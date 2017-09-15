class String
  def highlight
    gsub(/\(([A-Za-z]+)\)/, "#{Degica::ANSI.highlight('\1', :yellow)}")
  end
end
