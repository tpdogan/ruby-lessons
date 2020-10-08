require 'json'

module BasicSerialize
  @@serializer = JSON
  def serialize
    ser = {}
    get_attr.map do |var|
      ser[var] = get_attr[var]
    end
    @@serializer.dump ser
  end

  def unserialize(string)
    ser = @@serializer.load string
    ser.keys.map do |key|
      set_attr(key, ser[key])
    end
  end
end

class Person
  include BasicSerialize
  attr_accessor :name, :age, :job
  def initialize(name, age, job)
    @name = name
    @age = age
    @job = job
  end
  
  def get_attr
    {:name => @name,
    :age => @age,
    :job => @job}
  end

  def set_attr(key, value)
    @key = value
  end
end

me = Person.new('Tmr', 30, 'Webber')
puts ser = me.serialize
puts me.unserialize(ser)
puts me.name
