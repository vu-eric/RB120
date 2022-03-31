module Towable
  def can_tow?(pounds)
    pounds < 2000
  end 
end 

class Vehicle 
  attr_accessor :color
  attr_reader :year, :model 

  @@number_of_vehicles = 0 

  def self.number_of_vehicles 
    puts @number_of_vehicles 
  end 

  def initialize(year, color, model)
    @year = year 
    @color = color 
    @model = model 
    @@number_of_vehicles += 1
    @current_speed = 0 
  end 

  def self.gas_mileage(gallons, miles)
    miles / gallons
  end 

  def speed_up(number)
    @current_speed += number  
  end 

  def brake(number)
    @current_speed -= number 
  end 

  def shutdown
    @current_speed = 0 
  end 

  def spray_paint(color)
    self.color = color 
  end 

  def age 
    years_old 
  end 

  private 

  def years_old 
    Time.now.year - self.year 
  end 

end 

class MyCar < Vehicle 

  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{color}, #{year}, #model}!"
  end 

end 

class MyTruck < Vehicle 
  include Towable 
  NUMBER_OF_DOORS = 2
end 


class Student
  def initialize(name, grade)
    @name = name 
    @grade = grade 
  end 

  def better_grade_than?(student)
    @grade > student.grade 
  end 

  protected 
  
  def grade 
    @grade 
  end 

end 

puts MyCar.ancestors
puts MyTruck.ancestors 
puts Vehicle.ancestors 
