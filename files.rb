filename = 'ruby-dummy3.txt'
filewrite = open(filename,'w')
filewrite.puts "This is a dummy file!\n"

require 'open-uri'
remote = URI.open('https://www.theodinproject.com/').read
filewrite.write(remote)
filewrite.close

open(filename,'w+') do |thefile|
  thefile.puts %{More text to be added
Afterall, this is a dummy}
end

fileread = open(filename,'r+')
puts fileread.read
fileread.puts %{Farewell mister dundy
Lorem ipsum dolores
Have you ever..}
fileread.rewind
filelines = fileread.readlines
puts filelines[0]
puts filelines[4]

fileread.rewind
while !fileread.eof? do
  p fileread.readline
end

=begin
  File modes
  Mode |  Meaning
-----+--------------------------------------------------------
"r"  |  Read-only, starts at beginning of file  (default mode).
-----+--------------------------------------------------------
"r+" |  Read-write, starts at beginning of file.
-----+--------------------------------------------------------
"w"  |  Write-only, truncates existing file
     |  to zero length or creates a new file for writing.
-----+--------------------------------------------------------
"w+" |  Read-write, truncates existing file to zero length
     |  or creates a new file for reading and writing.
-----+--------------------------------------------------------
"a"  |  Write-only, starts at end of file if file exists,
     |  otherwise creates a new file for writing.
-----+--------------------------------------------------------
"a+" |  Read-write, starts at end of file if file exists,
     |  otherwise creates a new file for reading and
     |  writing.
-----+--------------------------------------------------------
"b"  |  Binary file mode (may appear with
     |  any of the key letters listed above).
     |  Suppresses EOL <-> CRLF conversion on Windows. And
     |  sets external encoding to ASCII-8BIT unless explicitly
     |  specified.
-----+--------------------------------------------------------
"t"  |  Text file mode (may appear with
     |  any of the key letters listed above except "b"). 
=end