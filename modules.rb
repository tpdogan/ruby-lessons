# Modules are to keep constants etc
module MyLibrary
    # Normally FAVE_BOOK = "Green"
    # Adding || stops giving already initialized comment
    FAVE_BOOK ||= "Green"
    def read
        FAVE_BOOK
    end
end
# Module constants are called with ::
puts Math::PI
# If a module is not implemented by default, require it
require 'date'
puts Date.today
# Classes can include modules with to use their constant etc
class Angle
    # Including a module (mixin) or a class
    # mixin is a way to include methods without inheritence
    include Math
    attr_accessor :radians

    def initialize(rad)
        @radians = rad
    end
    def cosine
        cos(@radians)
    end
end
ang = Angle.new(5)
puts "For #{ang.radians} cos is #{ang.cosine}"
ang.radians = 2
puts "For #{ang.radians} cos is #{ang.cosine}"
# Following gives error
#puts Angle.cosine
# include insert (Module) methodes inside a class
# extend insert (Module) methodes at a class level
class ExtendedAngle
    extend MyLibrary
    attr_accessor :radians
    @radians = 1
end
puts ExtendedAngle.read
