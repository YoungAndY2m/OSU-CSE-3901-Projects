require 'mechanize'
require 'nokogiri'
require 'open-uri'
require_relative "../Model/PastMatches.rb"
require_relative "../Model/UpcomingMatches.rb"
require_relative "../Model/Recap.rb"
require 'json'

SportsData = []
@pastMatches = []
@pastMatchesInJson = []
@upcomingMatches = []

<<-doc
    Scrappes a website for some elements and return the elements as an array
    @para   url: The url of the site to scrapp
    @para selector: The attribute used to select the element
    @return :An array of HTML elements that matches the selector
    doc
def scrapper(url, selector)
    html = open(url).read()
    parsed_page = Nokogiri::HTML(html)
    event_listing = parsed_page.css(selector)
    return event_listing
end

<<-doc
    Convert ruby object into json
    Save object into json file
    The json file should be saved in the Data folder
    doc
def convertIntoJson(object, filename)
    File.open("#{filename}", "w") do |f|
        f.write(JSON.pretty_generate(object))
        f.close
    end
end

<<-doc
    Goes through all the previous matches with an opponent, and gets the links for the recaps
    @param team: Name of team to get recaps for
doc
def getHistory(teamName)
    stats = [0,0,0]
    recapLinks=[]
    @pastMatches.each do |item|
        if item.opponent==teamName
            recap=Recap.new(item.recap,item.date)
            recapLinks << recap.as_json
            if item.result.include?("W")
                stats[0] = stats[0]+1
            elsif item.result.include?("T")
                stats[1] = stats[1]+1
            elsif item.result.include?("L")
                stats[2] = stats[2]+1
            end
        end
    end
    [stats, recapLinks]
end


<<-doc
    Scrappes a website for some data and stores it in a json file
    @para url: The url of the site to scrape
    @para filename: the name of the json file to save into
doc
def getPastMatches(url, year)
    pastMatches = []
    pastMatches << "OSU Past Matches for #{year} Football year"
    scrapper(url, 'div.ohio--schedule-item').each do |match|
        if match.css('div.ohio--schedule-time').css('span').text.split[0] =~ /[WLD]\w*/
            pastMatch = PastMatches.new(match.css('div.ohio--schedule-date').css('span').text + year,
            match.css('div.ohio--schedule-time').css('span').text.split,
            match.css('div.ohio--schedule-team-name').css('h3').text.strip,
            match.css('div.ohio--schedule-team-logo').css('img').attribute('src'),
            match.css('div.ohio--schedule-team-name').css('span').text.split,
            "https://ohiostatebuckeyes.com/#{match.css('div.schedule-links').css("div.ohio--schedule-link").css("a").attribute('href')}")
            pastMatches << pastMatch.as_json
            @pastMatches << pastMatch
        end
    end
    @pastMatchesInJson.unshift pastMatches
end

<<-doc
    Scrappes a OSU footbal schedule website for upcoming matches
    @param url: the url for OSU football schedule website
doc
def getUpcomingMatches(url) 
    @upcomingMatches << "Upcoming Matches For OSU Football Team"   
    scrapper(url, 'div.ohio--schedule-item').each do |match|
        if !(match.css('div.ohio--schedule-time').css('span').text.split[0] =~ /[WLD]\w*/)
            history = getHistory(match.css('div.ohio--schedule-team-name').css('h3').text.strip)
            upcomingMatch = UpcomingMatches.new(match.css('div.ohio--schedule-date').css('span').text + " 2021",
            match.css('div.ohio--schedule-time').css('span').text.split,
            match.css('div.ohio--schedule-team-name').css('h3').text.strip,
            match.css('div.ohio--schedule-team-logo').css('img').attribute('src'),
            match.css('div.ohio--schedule-team-name').css('span').text.split,
            history[1],
            history[0])
            @upcomingMatches << upcomingMatch.as_json
        end
    end
end


yearStart = 2011
yearEnd = 12

while yearStart < 2022
    getPastMatches("https://ohiostatebuckeyes.com/sports/m-footbl/schedule/season/#{yearStart}-#{yearEnd}/", " #{yearStart}")
    yearStart=yearStart+1
    yearEnd=yearEnd+1
    #2020-2000
end

getUpcomingMatches("https://ohiostatebuckeyes.com/sports/m-footbl/schedule")

convertIntoJson(@pastMatchesInJson, "./Data/PastMatches.json")
convertIntoJson(@upcomingMatches, "./Data/UpcomingMatches.json")


