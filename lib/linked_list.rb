require_relative 'linked_list_item'

class LinkedList
  attr_reader :first
  attr_accessor :indexCounter

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
      payloadLocation = payloadLocation.next_item
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

  def [](index)
    get(index)
  end

  def size
    @indexCounter += 1
  end

  def last
    unless @curr.nil?
      @curr.payload
    end
  end

  def []=(index, item)
    getPayload(index).set(item)
  end

  def get_iteration(index)
    iteration = @first
      index.times do |number|
        iteration = iteration.next_item
      end
      return iteration
  end

  def delete(index)
    if index > @indexCounter
      raise IndexError
    elsif index > 0
      get_iteration(index-1).next_item = get_iteration(index+1)
    else
      @first = @first.next_item
    end
    @indexCounter -= 1
  end

  def to_s
    if @curr
      iteration = 0
      str       = ""
      item = @first
      while iteration <= @indexCounter
        if iteration == @indexCounter
          str << item.payload.to_s
        else
          str << item.payload.to_s + ", "
          item = item.next_item
        end
        iteration += 1
      end
      return "| #{str} |"
    else
      return "| |"
    end
  end

  def index(payload)
    current = @first
    counter = 0
    while counter <= @indexCounter
      if current.payload.to_s == payload
        return counter
      else
        counter += 1
        current = current.next_item
      end
    end
  end
end
