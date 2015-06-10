class Person
  attr_accessor :name, :url, :tagline, :bio, :education, :work, :codeschool, :treehouse, :codecademy, :coderwall, :blog, :cities

  @@students = []

  def initialize(name, url, tagline, bio, education, work, codeschool, treehouse, codecademy, coderwall, blog, cities)
    @name = name 
    @url = url
    @tagline = tagline
    @bio = bio
    @education = education
    @work = work
    @codeschool = codeschool
    @treehouse = treehouse
    @codecademy = codecademy
    @coderwall = coderwall
    @blog = blog
    @cities = cities
    @@students << self
  end

  def self.count 
    return @@students.size
  end 

  def self.list 
    @@students.each.with_index(1) do |student, index|
      if index < 10
        puts "#{index}.  #{student.name}"
      else
        puts "#{index}. #{student.name}"
      end
    end 
  end 

  def self.return(query)
    @@students.find do |student|
      student.name.downcase == query 
    end 
  end

  def self.return_ind(query)
    @@students[query-1]
  end 

  def self.get_options
    return ["name", "url", "tagline", "bio", "education", "work", "codeschool", "treehouse", "codecademy", "coderwall", "blog", "cities"]
  end
end