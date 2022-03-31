# Question 1
# Solution: Ben is correct. balance on line 9 is referencing the instance method created by attr_reader :balance. 
#
# Question 2
# Solution: There are two fixes. One is to change the quantity on line 11 to @quantity. The second is to create an instance method named quantity=, either by defining it manually or by adding attr_writer :quantity, and then changing quantity to self.quantity. 
#
# Question 3
# Solution: It's not ideal because the setter method will be public, which makes the update_quantity instance method redundant. 
#
# Question 4
class Greeting
  def greet(message)
    puts messaage 
  end 
end 

class Hello < Greeting 
  def hi
    greet("Hello")
  end 
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end 

# Question 5
class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s 
    @filling_type = "Plain" unless @filling_type
    @glazing = @glazing ? " with #{@glazing}" : ""
    "#{@filling_type}#{@glazing}"
  end 
end

# Question 6
# Solution: There's no different in the result. 
#
# Question 7
# Solution: Rename light_status to status. 
