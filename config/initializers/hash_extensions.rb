class Hash

  def key
    raise "Sorry dude, got more than one key." if self.keys.size > 1
    keys.first
  end

  def value
    raise "Sorry dude, got more than one value." if self.values.size > 1
    values.first
  end

end