Optionil = Object
class Optionil
  def self.[](x = nil)
    x
  end
  # {Some} is actually not a class. Take 1 arg
  def (Some = ->{ !_1.nil? }).[](x)
    case x
    in self
      x
    end
  end
  # Take 0 args
  # @return [nil]
  def (None = NilClass).[]
  end
  
  def value(&blk)
    nil? ? blk&.() : self
  end
  def value!
    Some[self]
  end
  def each(&blk)
    if blk
      blk.(self) unless nil?
    else
      enum_for __callee__
    end
  end
  
  def some?(matcher = nil, &blk)
    (matcher.nil? ? blk || Some : matcher) === self
  end
  def none?(...)
    !some?(...)
  end
end
