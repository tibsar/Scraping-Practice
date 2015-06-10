class Person
  attr_accessor :name, :tag_line, :url

  @@students = []

  def initialize
    @@students << self
  end

end