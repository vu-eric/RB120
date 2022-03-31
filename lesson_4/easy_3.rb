# Question 1
# Solution: 
#   Case 1) output "Hello"
#   Case 2) Error, no method bye 
#   Case 3) Error, 0 parameters expected 1
#   Case 4) output "Goodbye"
#   Case 5) Error, no class method greet 
#
# Question 2 
# Solution: We can define a class method by adding def self.hi ... end. Note that we cannot directly call instance methods from superclasses in the class method definition. Instead we have to create a new instance of the superclass and call the method using that instance. 
#
# Question 3 
# Solution: call new on AngryCat twice, each time with two parameters. 

# Question 4
# Solution: def to_s "I am a #{@type} cat" end
#
# Question 5
# Solution: tv.manufacturer will return an error since there is no instance method defined name manufacturer. Television.model will return an error since there is no class method defined with name model. 
#
# Question 6
# Solution: @age += 1

