class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max)
  end

  def insert(num)
    @store[num] = true if is_valid?(num)
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    if @store[num] == true
      true
    else
      false
    end
  end

  private

  def is_valid?(num)
    if num >= @max || num < 0
      raise 'Out of bounds'
    else
      true
    end
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    index = num % 20
    @store[index] << num
  end

  def remove(num)
    index = num % 20
    @store[index].delete(num)
  end

  def include?(num)
    index = num % 20
    if @store[index].include?(num)
      true
    else
      false
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count < num_buckets
      index = num % num_buckets
      @store[index] << num
    else
      resize!
      index = num % num_buckets
      @store[index] << num
    end
    @count += 1
  end

  def remove(num)
    index = num % num_buckets
    if @store[index].include?(num)
      @store[index].delete(num)
    end
    @count -= 1
  end

  def include?(num)
    index = num % num_buckets
    if @store[index].include?(num)
      true
    else
      false
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_bucket = @store
    new_bucket = Array.new(num_buckets * 2) { Array.new }
    old_bucket.each do |bucket|
      bucket.each do |number|
        new_bucket[number % (num_buckets * 2)] << number
      end
    end
    @store = new_bucket
  end
end
