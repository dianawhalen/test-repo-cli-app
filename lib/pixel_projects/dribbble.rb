class PixelProjects::Dribbble
  attr_accessor :title, :comment, :shot_url, :designer_url, :designer_name, :name, :location, :bio, :skills, :teams, :shots, :links, :profile_url, :playbook, :twitter, :instagram, :web

  @@all = []

  def initialize(dribbbles)
    dribbbles.each {|key, value| self.send(("#{key}="), value) }
    @@all << self
    # binding.pry
  end

  def self.create_from_collection(dribbbles)
    dribbbles.each {|dribbble| PixelProjects::Dribbble.new(dribbble) }
  end

  def self.all
    @@all
    # binding.pry
  end

end
