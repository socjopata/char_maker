class Integer
  def d(n)
    (1..self).inject(0) { |a, e| a + rand(n) + 1 }
  end
end