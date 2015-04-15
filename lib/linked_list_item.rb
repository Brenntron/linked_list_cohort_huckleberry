class LinkedListItem
  include Comparable
  attr_reader   :payload, :next_item

  def initialize(payload)
    @payload = payload
  end

  def <=>(lli)
    if self.payload.class == lli.payload.class
      self.payload <=> lli.payload
    else
      self.payload.class.to_s <=> lli.payload.class.to_s
    end
  end

  def next_item=(lli)
    raise ArgumentError, "Can't set next_item to self" if self == lli
    @next_item = lli
  end

  def last?
   @next_item.nil?
  end

  def ===(lli)
    self.equal? lli
  end
end
