# class Fixnum
#   # Fixnum#hash already implemented for you
# end

# class Array
#   def hash
#     sum = 0
#     self.each_with_index do |el, i|
#       if el.is_a?(Fixnum)
#         sum += el * i
#       else
#         sum += el.to_s.ord * i
#       end
#     end
#     sum.hash
#   end
# end
#
# class String
#   def hash
#     sum = 0
#     self.each_char.with_index do |char, i|
#       sum += (char.ord * i)
#     end
#     sum.hash
#   end
# end
#
# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     array = self.keys.sort! + self.values.sort!
#     sum = 0
#     array.each_with_index do |el, i|
#       if el.is_a?(Fixnum)
#         sum += (el * i)
#       else
#         sum += el.to_s.ord * i
#       end
#     end
#     sum.hash
#   end
# end

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    each_with_index.inject(0) do |intermediate_hash, (el, i)|
      (el.hash + i.hash) ^ intermediate_hash
    end
  end
end

class String
  def hash
    chars.map(&:ord).hash
  end
end

class Hash
  def hash
    to_a.sort_by(&:hash).hash
  end
end
