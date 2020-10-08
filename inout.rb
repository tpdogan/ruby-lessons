# IO class
# 0: stdin, 1: stdout, 2: stderr

inout = IO.new(1)
inout.puts "Hello world"

# /dev/null is null device in linux
fd = IO.sysopen('/dev/null', 'w+')
dev_null = IO.new(fd)
dev_null.puts 'hello'
dev_null.gets
dev_null.close
# Next code creates and writes to new file
dir = '/home/tamer/Documents/projects/rubies/'
file = IO.sysopen(dir + 'ruby-dummy2.txt','w+')
create = IO.new(file)
create.puts "I'm in! "
create.gets
create.close
# When reading from file take care of the cursor position
file = IO.sysopen(dir + 'ruby-dummy.txt','r')
create = IO.new(file)
p create.gets
p 'Cursor is at ' + create.pos.to_s
while !create.eof? do # Checks for End Of File (EOF)
  p create.gets
end
p 'End of file'
p '--------------------------'
create.rewind
p "We're back at the start! Let's read all:"
puts create.read
create.close
# Socket test failed
=begin
require 'socket'
socket = TCPSocket.new 'localhost', 3000
puts socket
=end
# String IO
require 'stringio'
strIO = StringIO.new('Hi earth')
puts strIO.gets
strIO.puts "\nBye blue planet"
strIO.rewind
puts strIO.read
# JSON example
serial = {"Name": "John Doe",
  "Phone Numbers": [12345,67890,13579],
  "DOB": {"D": 18, "M": 2, "Y": 1974}}
