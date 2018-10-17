# CLI Controller
class PixelProjects::CLI

  BASE_PATH = "https://dribbble.com/"

  def call
    make_dribbbles
    make_designers
    add_attributes_to_designers
    # display_designers
  end

  # def list_dribbbles
  #   @dribbbles = PixelProjects::Scraper.current
  #   @dribbbles.each.with_index(1) do |dribbble, i|
  #     puts "#{i.to_s.rjust(2, "0")}. Dribbble: " + %Q{'#{dribbble[:title]}'} + " by #{dribbble[:designer_name]}"
  #     puts "    Shot Url: " + "#{dribbble[:shot_url]}"
  #     puts "    Designer Url: " + "#{dribbble[:designer_url]}"
  #     puts "    Comment: " + %Q{"#{dribbble[:comment].gsub("\n","")}"}
  #     puts "⭑-------------------------------------------------------------⭑"
  #   end
  # end

  def make_dribbbles
    dribbbles = PixelProjects::Scraper.scrape_dribbbles(BASE_PATH + '#')
    PixelProjects::Dribbble.create_from_collection(dribbbles)
    # binding.pry
  end

  def make_designers
    PixelProjects::Dribbble.all.each do |dribbble|
     designers = PixelProjects::Scraper.scrape_designer(BASE_PATH + dribbble.designer_url)
     PixelProjects::Designer.create_from_collection(designers)
   end
    # binding.pry
  end

  def add_attributes_to_designers
    PixelProjects::Designer.all.each do |designer|
      attributes = PixelProjects::Scraper.scrape_designer(BASE_PATH + designer.designer_url)
      designer.add_designer_attributes(attributes)
    end
  end

  # def display_designers
  #   PixelProjects::Designer.all.each do |designer|
  #     puts "  name:" + "#{designer.name.upcase}"
  #     puts "  location:" + " #{designer.location}"
  #     puts "  bio:" + " #{designer.bio}"
  #     puts "  skills:" + " #{designer.skills}"
  #     puts "  teams:" + " #{designer.skills}"
  #     puts "----------------------"
  #   end
  # end
# binding.pry
end



# -------------------------------------------------------------------------------------------------
#   def call
#     list_dribbbles
#     menu
#     goodbye
#   end
#
#   def list_dribbbles
#     @dribbbles = PixelProjects::Scraper.current
#     @dribbbles.each.with_index(1) do |dribbble, i|
#       puts "#{i.to_s.rjust(2, "0")}. Dribbble: " + %Q{'#{dribbble[:title]}'} + " by #{dribbble[:designer_name]}"
#       puts "    Shot Url: " + "#{dribbble[:shot_url]}"
#       puts "    Designer Url: " + "#{dribbble[:designer_url]}"
#       puts "    Comment: " + %Q{"#{dribbble[:comment].gsub("\n","")}"}
#       puts "⭑-------------------------------------------------------------⭑"
#     end
#   end
#
#   def list_designer
#     @designer_hash = PixelProjects::Scraper.scrape_designer
#       puts "    Name: " + @designer_hash[:name]
#       puts "    Location: " + @designer_hash[:location]
#       puts "    Bio: " + @designer_hash[:bio]
#       puts "    Skills: " + @designer_hash[:skills].join(", ")
#       puts "    Teams: " + @designer_hash[:teams].join(", ")
#       puts "⭑-------------------------------------------------------------⭑"
#   end
#
#   def menu
#     input = nil
#     while input != "exit"
#       puts "Enter the number corresponding to the Dribbble you'd like additional information on."
#       puts "To see the most recent Dribbbles again, type 'list', or type 'exit' to quit."
#       input = gets.strip.downcase
#
#       if input.to_i > 0
#         the_dribbble = @dribbbles[input.to_i-1]
#         puts "⭑-------------------------------------------------------------⭑"
#         puts "    ⭑ Shot Title: " + "#{the_dribbble[:title]}"
#         puts "    ⭑ Designer: " + "#{the_dribbble[:designer_name]}"
#         puts "    ⭑ Comment: " + %Q{"#{the_dribbble[:comment].gsub("\n","")}"}
#         puts "         ⭑     ⭑     ⭑     ⭑     ⭑     ⭑     ⭑     ⭑         "
#         puts "    For additional information about this Dribbble, type 'designer' or 'shot'."
#         puts "⭑-------------------------------------------------------------⭑"
#       elsif input == "designer"
#         list_designer
#       elsif input == "shot"
#         list_shot
#       elsif input == "list"
#         list_dribbbles
#       else
#         puts "I didn't understand that request, type 'list' or 'exit'."
#       end
#     end
#   end
#
#   def goodbye
#     puts "See you next time for more interesting trending shots!"
#   end
# end
