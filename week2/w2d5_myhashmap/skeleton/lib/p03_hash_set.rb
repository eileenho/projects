require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if count >= num_buckets
      resize!
    end
    index = key.hash % num_buckets
    @store[index] << key
    @count += 1
  end

  def include?(key)

    if self[key.hash].include?(key)
      return true
    else
      return false
    end
  end

  def remove(key)
    return nil unless include?(key)
    self[key.hash].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets
    @store[index]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_array = @store
    @count = 0
    new_array = Array.new(num_buckets * 2) { Array.new }
    old_array.each do |bucket|
      bucket.each do |el|
        new_array[el.hash % num_buckets] << el
      end
    end
    @store = new_array
  end
end

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
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next = nil
    self.prev = nil
    self
  end

end

class LinkedList
  include Enumerable

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
    empty? ? nil : @head.next
  end

  def last
    empty? ? nil : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |link| return link.val if link.key == key }
    nil
  end

  def include?(key)
    any? { |link| link.key == key }
  end

  def append(key, val)
    new_link = Link.new(key, val)

    @tail.prev.next = new_link
    new_link.prev = @tail.prev
    new_link.next = @tail
    @tail.prev = new_link

    new_link
  end

  def update(key, val)
    each do |link|
      if link.key == key
        link.val = val
        return link;
      end
    end
  end

  def remove(key)
    each do |link|
      if link.key == key
        link.remove
        return link.val
      end
    end

    nil
  end

  def each
    current_link = @head.next
    until current_link == @tail
      yield current_link
      current_link = current_link.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
