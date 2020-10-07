add = 1 + 1
subs = 3 - 2
mult = 5 * 4
div = 8 / 2
puts add
puts subs
puts mult
puts div
puts '-----------------------------1'
str = "#{subs} good" + ' ' + "example."
newl = "Am I on a newline?"
print str; print newl;
puts str; puts newl;
p str
=begin #(this begins multiline comment)
name = gets
sur = gets.chomp
puts name + sur;
putc name; puts sur;
=end #(this ends multiline comment)
puts 'line 19'
puts [1,nil,5]
print [1,nil,5]
puts '-----------------------------1.5'
def numbers
    puts 123
end
def numnum
    p 123
end
puts result = numbers.to_s + '!'
puts res = numnum.to_s + '!'
# r is to read only
dummy = "ruby-dummy.txt"
aFile = File.new(dummy, "r")
if aFile
    # Reads the 30 characters of the file
    content = aFile.sysread(30)
    puts content
else
    puts "Unable to read file"
end
aFile.close
puts '-----------------------------2'
#puts `clear` #This clears the terminal
# r+ allows both read and write
aFile2 = File.new(dummy, "r+")
if aFile2
    # Writes string to file (replaces existing text)
    aFile2.syswrite("ABCDEF")
    # Cursor to the beginning
    aFile2.rewind
    puts aFile2.sysread(6)
    aFile2.rewind
    aFile2.syswrite("This f")
else
    puts "Unable to open file"
end
puts '-----------------------------3'
aFile2.rewind
aFile2.each_byte {|ch| putc ch; putc '.'}
puts '-----------------------------4'
lines = IO.readlines(aFile2)
puts lines[2]
puts lines.join('!') # joins array elements
puts '-----------------------------5'
IO.foreach(aFile2) {|line| putc line}; puts ""
# File.rename('a.txt','b.txt') # renames file
# File.delete('b.txt') # deletes file
# File.new('a.txt','w').chmod(0755) # adds mode/permission
File.open('a.txt') if File::exists?('a.txt') # File.open('a.txt') would cause error!!!
puts File.file?('a.txt') # Returns whether the file is really a file
puts File::directory?('/usr') # Returns whether the dir is really a dir
puts File.readable?(dummy)
puts File.writable?(dummy)
puts File.executable?(dummy)
puts File.zero?(dummy)
puts dummy + ' is ' + File.size?(dummy).to_s + ' bytes'
puts File::ftype(dummy)
puts %{#{dummy} is created on #{File::ctime(dummy)}
            last modified on #{File::mtime(dummy)}
            last accessed on #{File::atime(dummy)}}
puts '-----------------------------6'
# Dir.chdir('/usr/bin') # changes dir
puts Dir.pwd
puts Dir.entries('/home/tamer/Documents/projects/rubies').join(' ')
Dir.foreach('/home/tamer/Documents/projects/rubies') do |entry|
    print entry + '|'
end
puts ''
puts Dir['/home/tamer/Documents/projects/rubies/*']
# Dir.mkdir('newdir',755) # makes new dir
# Dir.delete('deleted') # deletes dir
=begin # create temporary files
require 'tempfile'
fileTemp = Tempfile.new('illbegon.txt')
fileTemp.puts 'Hallo'
puts fileTemp.path
fileTemp.close
=end