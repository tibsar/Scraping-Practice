require 'open-uri'
require 'nokogiri'


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
    bio = student_page.css("div#scroll-about div#equalize:first div#ok-text-column-2 div.services p").text
    puts bio

  end
end

scrape