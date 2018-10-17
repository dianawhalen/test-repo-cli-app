class PixelProjects::Designer
  attr_accessor :title, :comment, :shot_url, :designer_url, :designer_name, :name, :location, :bio, :skills, :teams, :shots, :links, :profile_url, :playbook, :twitter, :instagram, :web

  @@all = []

  def initialize(designers)
    designers.each {|key, value| self.send(("#{key}="), value) }
    @@all << self
  end

  def self.create_from_collection(designers)
    designers.each {|designer| PixelProjects::Designer.new(designer) }
    # binding.pry
  end

  def add_designer_attributes(attributes_hash)
    attributes_hash.each {|key, value| self.send(("#{key}="), value) }
    # binding.pry
  end

  def self.all
    @@all
    # binding.pry
  end

end
