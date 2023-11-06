#this page does all the ruby computation - getting the data, parsing through it, etc.
#it then dynamically renders the html template (template.html.erb) with the correct variables and prints this new rendering to an html page to actually display 
require 'json'
require 'pp'
require 'erb'

#load sport schedule and data in from Data folder 
data_file = File.read("./Data/UpcomingMatches.json")
data_hash = JSON.parse(data_file)
pp data_hash
@upcomingMatches = data_hash

#load sport schedule and data in from Data folder 
data_file = File.read("./Data/PastMatches.json")
data_hash = JSON.parse(data_file)
pp data_hash
@pastMatches = data_hash
@page_title = "Ohio State University Sports"
@page_heading = "Ohio State Men's Football Game Schedule Summary"

#get opponents' logos array
#@opp_logos = data_hash.map{|opp| opp["opponentLogo"]}.compact
# render the template with the variables binded
template = File.read('./View/template.html.erb')
#template = File.read('./scratch_work.html.erb')  #--this is the prettier one :(
result = ERB.new(template).result(binding)

#write dynamically generated result to main file to display
File.open('./View/index.html', 'w+') do |f|
  f.write result
end
#file is automatically closed with File.open do ... end
