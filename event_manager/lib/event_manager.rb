require 'csv'
require 'open-uri'
require 'json'
filename = 'event_attendees.csv'

puts "EventManager Initialized!"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,'0')[0..4]
end

def legislators_by_zipcode(zipcode)
  legislator_Names = []
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
          legislator_Names.push(each_official['name'])
        end
        break
      end
    end

  rescue
    legislator_Names.push("You can find your own representative..")
  end
  return legislator_Names
end

contents = CSV.open filename, headers: true, header_converters: :symbol
register_attendees = []

contents.each do |row|
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislator = legislators_by_zipcode(zipcode)
  current = [name, zipcode, legislator]
  puts name + ' ' + zipcode + ' ' + legislator.join(', ')
  register_attendees.push(current)
end