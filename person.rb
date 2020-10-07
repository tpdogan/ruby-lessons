class Person
    # Global variable
    $animal_type = "human"
    # Class variable
    @@people_count = 0
    # Attribute reader and writer
    # These create methods to get and set
    attr_reader :name
    attr_writer :profession
    # This allows both get and set
    attr_accessor :age
    # Class initializer
    def initialize(name, age, profession)
        @name = name
        @age = age
        @profession = profession
        @@people_count += 1
    end
    # Method to be overriden
    def adult?
        return "Yes"
    end
    # Method to be super
    def treat_as_adult?
        return "Yes"
    end
    # Self allows Person.number_of_instances call
    def self.number_of_instances
        return @@people_count
    end
end

# Child class inherits from Person
# A class can only inherit one superclass
class Child < Person
    def adult?
        return "No"
    end
    def treat_as_adult?
        super
    end
end

# Call global variable
puts $animal_type
# Create person instances
matz = Person.new("Yukihiro", 32, "Programmer")
dhh = Person.new("David", 25, "Sailor")
# Call to a self method
puts "Number of People: #{Person.number_of_instances}"
# Create a child class and call self method
kid = Child.new("Jason", 8, "Student")
# In total there are 3 now!
puts "Number of People: #{Person.number_of_instances}"
# Overriden method
puts "Is Jason adult? #{kid.adult?}!"
# Super method
puts "Do we treat Jason as an adult? #{kid.treat_as_adult?}!"