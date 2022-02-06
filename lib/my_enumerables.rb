module Enumerable
  def my_select
    selected_values = []
    self.my_each do |v|
      if yield(v)
        selected_values << v 
      end
    end
    selected_values
  end
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    (self.size()).times do |i| 
      yield self[i]
    end
    self
  end
  # Define my_each here
  def my_each_with_index
    (self.size()).times do |i|
      yield(self[i],i)
    end
    self
  end

end

numbers = [1,2,3,4,5]
puts numbers.select {|v| v>2}
puts numbers.my_select {|v| v>2}
