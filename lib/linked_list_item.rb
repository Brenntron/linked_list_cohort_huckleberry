class LinkedListItem
  include Comparable
  attr_reader :payload, :next_item

  def initialize(payload)
    @payload = payload
  end

  def next_item=(the_next_item)
    raise ArgumentError if the_next_item == self
    @next_item = the_next_item
  end
  def last?
    if @next_item.nil?
      return true
    else
      return false
    end
  end
  def <=>(other)
    if self.payload != other.payload
      self.payload <=> other.payload
    end
  end
end
