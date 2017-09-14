class String
  def highlight
    gsub(/\(([a-z]+)\)/, "#{Degica::ANSI.highlight('\1', :yellow)}")
  end
end
