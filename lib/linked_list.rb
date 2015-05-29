require_relative 'linked_list_item'

class LinkedList
  attr_reader :first
  attr_accessor :indexCounter

  def initialize(*payload)
    if payload[0]
      lli = LinkedListItem.new(payload[0])
      @last         = lli
      @first        = lli
      @indexCounter = 0
      number        = @indexCounter + 1
      while payload[number]
        llin = LinkedListItem.new(payload[number])
        @last.next_item = llin
        @last           = @last.next_item
        number         += 1
        @indexCounter  += 1
      end
    else
      @last         = nil
      @indexCounter = -1
    end
  end

  def push(payload)
    @indexCounter += 1
    lli            = LinkedListItem.new(payload)
    if @last         != nil
      @last.next_item = lli
    else
      @first = lli
    end
    @last = lli
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
      return @last.payload
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
    unless @last.nil?
      @last.payload
    end
  end

  def []=(index, item)
    getPayload(index).set(item)
  end

  def delete(index)
    if index > @indexCounter
      raise IndexError
    elsif index > 0
      getPayload(index-1).next_item = getPayload(index+1)
    else
      @first = @first.next_item
    end
    @indexCounter -= 1
  end

  def to_s
    if @last
      iteration = 0
      str       = ""
      item      = @first
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
        current  = current.next_item
      end
    end
  end

  def sorted?
    iteration = 0
    item      = @first
    if @indexCounter <= 0
     return true
    else
      while iteration <= @indexCounter
        if iteration == @indexCounter
          return true
        elsif item.payload.to_s > item.next_item.payload.to_s &&
          item.payload.class.to_s == item.next_item.payload.class.to_s
          return false
        elsif item.payload.class.to_s != item.next_item.payload.class.to_s &&
          item.payload.class.to_s > item.next_item.payload.class.to_s
          return false
        else
          iteration += 1
          item = item.next_item
        end
      end
    end

  end
end
