class LinkedListItem
  include Comparable
  attr_reader :payload, :next_item

  def initialize(payload)
    @payload = payload
  end

  def <=>(other)
    type0      = Fixnum
    type1      = String
    type2      = Symbol
    class1     = self.payload.class
    class2     = other.payload.class

    if (class1 == type0 && class2 == type0) || (class1 == type1 && class2 == type1) || (class1 == type2 && class2 == type2)
      return self.payload <=> other.payload
    elsif class1 == type0 && (class2 == type1 || class2 == type2)
      return false
    elsif class1 == type1 && class2 == type2
      return false
    else
      return true
    end
  end

  def next_item=(other)
    raise ArgumentError if other == self
    @next_item = other
  end

  def last?
    if @next_item.nil?
      return true
    else
      return false
    end
  end

  def ===(other)
    self.equal? other
  end

end
