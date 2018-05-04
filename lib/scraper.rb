require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)


    get_page = Nokogiri::HTML(open(index_url))

    scraped_students = []
    get_page.css("div.student-card").each do |student|
      scraped_students << {
        :name => student.css("h4").text,
        :location => student.css("p").text,
        :profile_url => index_url + student.at("a").attributes["href"].value
      }
    end
      scraped_students
  end


  def self.scrape_profile_page(profile_url)

  end

end
