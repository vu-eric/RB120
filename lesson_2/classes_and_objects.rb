class Person 
  attr_accessor :first_name, :last_name 
  attr_reader :name 

  def initialize(full_name)
    parts = full_name.split 
    @first_name = parts.first 
    @last_name = parts.size > 1 ? parts.last : ''
  end 

  def name 
    "#{first_name} #{last_name}".strip 
  end 

  def name=(name)
    parts = name.split 
    @first_name = parts.first 
    @last_name = parts.size > 1 ? parts.last : ''
  end 
 
end 
