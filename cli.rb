require_relative 'scrape.rb'
require 'pry'

def program_start
  puts "Welcome to Web0615"
  help_main
end 

def help_main
  puts "You can:\n'list': Lists all students\n'select': Learn more about a student\nexit: Exit the program" 
end

def help_select
  puts "You can type in the name of the person or their number"
end 

def help_person
  puts "You can view:\n'bio', 'education', go to their 'url', 'work', favorite 'cities', 'blog', 'tagline', 'treehouse' profile, 'coderwall' profile, or 'codecademy' profile\nYou can select another student by going 'back'"
end

def main_level
  print "Input: "
  input = gets.strip.downcase
  while input != 'exit'
    case input 
      when 'list'
        Person.list
      when 'select'
        if select_level == 'exit'
          break
        end 
      when 'help'
        help_main
      else
        puts "Please enter a valid command"
    end 
    print "Input: "
    input = gets.strip.downcase
  end
end 

def select_level
  help_select
  print "Input (select person): "
  input = gets.strip.downcase
  while (input != 'exit') && (input != 'back')
    case input.to_i 
      when 0
        p = Person.return(input)
        if p != nil
          person_info(p)
        elsif input == 'help'
          help_select
        else
          puts "Please enter a valid name"
        end 
      when (1..Person.count)
        if person_info(Person.return_ind(input.to_i)) == 'exit'
          return 'exit'
        end 
      else
        puts "Please enter a valid command"
      end 
    print "Input (select person): "
    input = gets.strip.downcase
  end 
  if input == 'exit'
    return 'exit'
  end
end

def person_info(person)
  options = Person.get_options
  puts "You have selected #{person.name}."
  help_person
  print "Input (info command): "
  input = gets.strip.downcase
  while (input != 'exit') && (input != 'back')
    if options.include?(input)

      output = person.send(input)
      #binding.pry
      if output!="unlisted" && output != ""

        puts person.send(input)

        if input=="url"

          system("open http://web0615.students.flatironschool.com/#{person.url}")
        end

      else
        puts "Sorry, that information was not provided."
      end
        
    else
      puts "Please enter a valid item"
    end 
    print "Input (info command): "
    input = gets.strip.downcase
  end
  if input == 'exit'
    return 'exit'
  end 
end 

def runner
  scrape
  program_start
  main_level
end

runner
