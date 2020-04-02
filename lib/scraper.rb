require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))

    students = doc.css(".student-card a")

    students.map do |student|
      student_name =     student.css(".card-text-container h4").text
      student_location = student.css(".card-text-container p").text
      student_profile =  student.attributes["href"].value
     
    student_list = {name: student_name, location: student_location, profile_url: student_profile}
    end 

  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))

    bio_details   = doc.css(".details-container .bio-block p").text
    quote         = doc.css(".vitals-text-container .profile-quote").text
    social_media  = doc.css(".social-icon-container a")
    
    student_profile = {bio: bio_details, profile_quote: quote}
    
 
    social_media.each do |social_icon|
      link = social_icon.attributes["href"].value
      if link.include?("twitter") 
        student_profile[:twitter] = link 
      elsif link.include?("github") 
        student_profile[:github] = link
      elsif link.include?("linkedin") 
        student_profile[:linkedin] = link        
      else     
        student_profile[:blog] = link
      end
    end
    student_profile     
  end

end

