## group5-redesign
## Summary
  We are redesigning professor Teodorescu's webpage and include almost all information from his original website. We combined the information and divided them into four pages: About me, Publications, Presentations, and Computer Architecture Research Lab that includes the research team and members information. 
  
  [Reference: http://web.cse.ohio-state.edu/~teodorescu.1/]

## Gem installed before running the scraper and create html page:
source 'https://rubygems.org'
- gem 'middleman', '~> 4.2'
- gem 'middleman-autoprefixer', '~> 3.0'
- gem 'tzinfo-data', platforms: [:mswin, :mingw, :jruby, :x64_mingw]
- gem 'wdm', '~> 0.1', platforms: [:mswin, :mingw, :x64_mingw]
- gem 'middleman-livereload', '~> 3.4', '>= 3.4.7'

## Visual Studio Code Extension installed:
- Code Runner
- Ruby
- Ruby Solargraph
- VSCode Ruby (automatically installed after you install Ruby extension)

## How to run the program:
- After you open the vscode, go to folder group5-redesign,
- Change direction and locate folder group5-redesign/webpageRedesign/source
- Type "bundle install" in the console, to install all the needed gems for this project
- Type "bundle exec middleman build" in the console, to build the html pages.
- Type "bundle exec middleman server" in the console, to check the html pages.

The command for the terminal: VirtualBox: ~/group5-redesign/webpageRedesign/source$ bundle exec middleman server

## User instruction:
 - After you open the html page, you could check the information regarding professor Teodorescu and his research team.
 - We've listed all the publications and separate them into conference paper, workshop paper, theses, and technical reports.
 - The research and tools tab in the original website linked to the Computer Architecture Research Lab, which we also combined into one html page. 

## Team members:
- Andrews Kontoh
- Chaobo Cai
- Yang Li
- Olivia Ridge
- Thomas Ghebremariam
