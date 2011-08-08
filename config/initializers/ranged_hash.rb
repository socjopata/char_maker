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
end
