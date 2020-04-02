class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    student_hash.each { |attributes, value| self.send(("#{attributes}="), value)}
    # @name          = student_hash[:name]
    # @location      = student_hash[:location]
    # @twitter       = student_hash[:twitter]
    # @linkedin      = student_hash[:linkedin]
    # @github        = student_hash[:github] 
    # @blog          = student_hash[:blog]
    # @profile_quote = student_hash[:profile_quote]
    # @bio           = student_hash[:bio]
    # @profile_url   = student_hash[:profile_url]
    @@all << self
  end 

  def self.create_from_collection(students_array)
    students_array.each { |student_hash| self.new(student_hash)}
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each { |attribute, value| self.send(("#{attribute}="), value) } 
  end

  def self.all
    @@all
  end

end

