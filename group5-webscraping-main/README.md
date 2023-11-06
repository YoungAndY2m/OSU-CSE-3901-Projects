## group5-webscraping
## Summary
  We are scraping data from OSU Sports website and create a summary for all the recaps and detailed information for Men's Football Schedule. It includes all the competitions between OSU Men's Football Team and other teams from 2011 to 2011 including upcoming matches.
  
  [Reference: https://ohiostatebuckeyes.com/sports/m-footbl/schedule/]

## Gem installed before running the scraper and create html page:
source "https://rubygems.org"
- gem 'nokogiri'
- gem 'mechanize'
- gem 'json'
- gem 'open-uri'
- gem 'erb'

## Visual Studio Code Extension installed:
- Code Runner
- Ruby
- Ruby Solargraph
- VSCode Ruby (automatically installed after you install Ruby extension)
- Live Server

## How to run the program:
- After you open the vscode, go to folder group5-webscraping,
- Type "make install_gem" in the console, to install all the needed gems for this project
- Type "make create_page" in the console, to scrape the data and generate the html page
- Go to folder View. Right click "index.html" file and select "Open with Live Server" OR
- Go to the folder located in your VM that contains folder group5-webscraping. Go to folder View and double click "index.html" file

The command for the terminal: VirtualBox: ~/group5-webscraping$ make create_page 

## User instruction:
 - After you open the html page, feel free to click any recap links about past matches.
 - We've listed all the timing and result for matches from 2011 to 2021. There's a summary for different opponents including numbers of wins, draws, and loss. 
 - For detailed information, please scroll down and locate the specific year. 

## Team members:
- Andrews Kontoh
- Chaobo Cai
- Yang Li
- Olivia Ridge
- Thomas Ghebremariam
