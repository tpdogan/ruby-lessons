require 'open-uri'

uri = 'http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt'
hamlet = URI.open(uri).read

filename = 'hamlet.txt'
open(filename,'w+') {|file| file.puts hamlet}

readham = open(filename,'r+')
# Below code reads and store every 42nd line
i = 1
ham42 = []
while !readham.eof? do
  if i%42 == 0
    ham42.push(readham.readline)
  else
    readham.readline
  end
  i += 1
end
readham.rewind
# Below code reads and stores only Hamlets lines
hambegin = 0
hamonly = []
while !readham.eof? do
  line = readham.readline
  if hambegin == 1
    if line[0..3] == '    '
      hamonly.push(line)
    else
      hambegin = 0
    end
  end
  if line[0..5] == '  Ham.'
    hamonly.push(line)
    hambegin = 1
  end
end
#puts hamonly
readham.close

p File.exists?(filename)
p File.exists?('/usr/')
p Dir.glob('/home/tamer/Desktop/*.{jpg,JPG,jpeg,JPEG}')