# -*- encoding : utf-8 -*-
class RangedHash
  def initialize(hash)
    @ranges = hash
  end

  def [](key)
    @ranges.each do |range, value|
      return value if range.include?(key)
    end
    nil
  end

  def to_hash
    hash = Hash.new
    @ranges.each do |range, value|
      hash["#{(range).begin}-#{(range).end}"] = value
    end
    hash
  end
end
