class Computer
    @@users = {}
    def initialize(username, password)
      @username = username
      @password = password
      @files = {}
      @@users[username] = password
    end
    public
    def create(filename)
      time = Time.now
      @files[filename] = time
      puts "File #{filename} is created by user #{@username} at #{time}"
    end
    private
    def get_userpass
      return @@users
    end
    # Class method cannot be private
    private
    def Computer.sneakusers
      return @@users
    end
  end
  
  my_computer = Computer.new('rby','123')
  my_computer.create('names.txt')
  # Below gives error -> cannot reach private
  #puts my_computer.get_userpass
  puts Computer.sneakusers