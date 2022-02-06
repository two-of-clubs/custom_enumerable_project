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

  def my_all?
    all_conditions_met = true
    self.my_each do |v|
      unless yield(v)
        all_conditions_met = false
      end
    end
    all_conditions_met
  end

  def my_any?
    one_condition_met = false
    self.my_each do |v|
      if yield(v)
        one_condition_met = true
      end
    end
    one_condition_met
  end

  def my_none?
    no_conditions_met = true
    self.my_each do |v|
      if yield(v)
        no_conditions_met = false
      end
    end
    no_conditions_met
  end

  def my_count
    count = 0
    return self.size unless block_given?

    self.my_each do |v|
      if yield(v)
        count += 1
      end
    end
    count
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
