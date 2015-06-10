require 'open-uri'
require 'nokogiri'
require 'pry'


def scrape
  html = open("http://web0615.students.flatironschool.com/").read
  student_index = Nokogiri::HTML(html)


  #loops through the main li block of each person
  student_index.css("li.home-blog-post").each do |item|
    name = item.css("div.big-comment h3 a").text
    url = item.css("div.blog-thumb a").attribute("href")
    html_student = open("http://web0615.students.flatironschool.com/#{url}")
    student_page = Nokogiri::HTML(html_student)
    tagline = student_page.css("div.textwidget h3").text
    info = student_page.css("div.ok-text-column div")
    #binding.pry
    bio = info[0].css("p").text.strip
    education = info[3].css("li").text.strip
    work = info[6].css("p").text.strip.gsub("\n", "").gsub("\t", "").gsub("     ", "")
    
    account = []   
    for i in 0..3 
      if info[9].css("p a")[i]!= nil
        account[i] = info[9].css("p a")[i].attr("href")
      else
        account[i] = "unlisted"
      end
    end
    codeschool = account[0]
    treehouse  = account[1]
    codecademy = account[2]
    coderwall = account[3]
    if info[12].css("p a").attr("href").to_s.length != 1
      blog = info[12].css("p a").attr("href")
    else 
      blog = "unlisted"
    end
    cities = info[18].css("p").text.strip.split("\n")
    #puts cities
    cities.each do |x|
      x.gsub!("                      ", "")
    end
    puts cities.inspect
  end
end

scrape