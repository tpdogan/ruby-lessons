require 'csv'
require 'open-uri'
require 'json'
require 'erb'
filename = 'event_attendees.csv'

puts "Event Manager Initialized!"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,'0')[0..4]
end

def legislators_by_zipcode(zipcode)
  legislators = {}
  link_part_1 = 'https://www.googleapis.com/civicinfo/v2/representatives?address=' 
  link_part_2 = '&levels=country&roles=legislatorUpperBody&roles=legislatorLowerBody&key=AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  
  begin
    link = link_part_1 + zipcode + link_part_2
    civic_info = URI.open(link).read
    unserialized = JSON.load civic_info

    unserialized.keys.map do |key|
      if key == 'officials'
        officials = unserialized[key]
        for each_official in officials
          legislators[each_official['name']] = each_official['urls'][0]
        end
        break
      end
    end

  rescue
    legislators['name'] = 'url'
  end
  return legislators
end

def letter_to_attendee(id, letter)
  Dir.mkdir("output") unless Dir.exists? "output"
  open("output/thanks_#{id}.html","w") {|f| f.puts letter}
end

def clean_phonenumber(number)
  digits = 0
  newnumber = ''
  valid = '0123456789'.split('')
  number.split('').each do |d|
    if valid.include? d
      digits += 1
      newnumber += d
    end
  end

  if digits == 10
    return newnumber
  elsif digits == 11 && number.split('')[0] == '1'
    return newnumber[1..newnumber.length]
  else
    return 'Bad number'
  end
end

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents = CSV.open filename, headers: true, header_converters: :symbol
regHours = []
regDays = []
regPhones = []

contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  regDate = DateTime.strptime(row[:regdate], '%m/%d/%Y %H:%M')
  regHours.push(regDate.hour)
  regDays.push(regDate.wday)
  
  legislators = legislators_by_zipcode(zipcode)
  
  personal_letter = erb_template.result(binding)

  regPhones.push(clean_phonenumber(row[:homephone]))

  letter_to_attendee(row[0], personal_letter)
end

puts "Event Manager Completed!"