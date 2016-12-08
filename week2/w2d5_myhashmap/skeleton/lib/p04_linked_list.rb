class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    link = @tail.prev
    until link.key == key
      if link.key == key
        return link.val
      else
        link = link.prev
      end
    end
  end

  def include?(key)
  end

  def append(key, val)
    new_link = Link.new(key, val)

    @tail.prev.next = new_link
    new_link.next = @tail
   @tail.prev = new_link
  end

  def update(key, val)
    link_to_update = @tail.prev
    unless link_to_update.key.nil?
      until link_to_update.key == key
        link_to_update = link_to_update.prev
      end
    end
    link_to_update.val = val
  end

  def remove(key)
    link = @tail.prev
    unless link.key.nil?
      until link.key == key
        link = link.prev
      end
    end
    link.prev.next = link.next
    link.next.prev = link.prev
  end

  def each

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
