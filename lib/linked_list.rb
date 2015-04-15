require_relative 'linked_list_item'

class LinkedList

  def initialize(*payload)
    if payload[0]
      lli = LinkedListItem.new(payload[0])
      @curr  = lli
      @first = lli
      @indexCounter = 0
      number = @indexCounter + 1
      while payload[number]
        llin = LinkedListItem.new(payload[number])
        @curr.next_item = llin
        @curr = @curr.next_item
        number += 1
        @indexCounter += 1
      end
    else
      @curr = nil
      @indexCounter = -1
    end
  end

  def push(payload)
    @indexCounter += 1
    lli = LinkedListItem.new(payload)
    if @curr != nil
      @curr.next_item = lli
    else
      @first = lli
    end
    @curr = lli
  end

  def getPayload(index)
    payloadLocation = @first
    index.times do |number|
      nextItem = payloadLocation.next_item
      payloadLocation = nextItem
    end
    return payloadLocation
  end

  def get(index)
    if index < 0 || index > @indexCounter
      raise IndexError
    elsif index == @indexCounter
      return @curr.payload
    else
      return getPayload(index).payload
    end
  end

  def size
    @indexCounter += 1
    return @indexCounter
  end

  def last
    if @curr
      return @curr.payload
    else
      @curr
    end
  end

  def to_s
    if @curr
      iteration = 0
      str       = ""
      itemCount = @first
      while iteration <= @indexCounter
        if iteration == @indexCounter
          str << itemCount.payload.to_s
        else
          str << itemCount.payload.to_s + ", "
          itemCount = itemCount.next_item
        end
        iteration += 1
      end
      return "| #{str} |"
    else
      return "| |"
    end
  end
end
