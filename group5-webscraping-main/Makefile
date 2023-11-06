#Run to install all gems
install_gem: 
			bundle install

#Create the HTML page
create_page: scrape_data
			ruby ./View/render_template.rb

#Scrape data 
scrape_data: 
			ruby ./Controller/controller.rb