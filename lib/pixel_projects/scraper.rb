class PixelProjects::Scraper
    attr_accessor :title, :comment, :shot_url, :designer_url, :designer_name, :name, :location, :bio, :skills, :teams, :shots, :links, :profile_url, :playbook, :twitter, :instagram, :web

  def self.current
    self.scrape_dribbbles(dribbbles_url)
    self.scrape_designer(designer_url)
    self.scrape_designer_links(designer_url)
  end

  def self.scrape_dribbbles(dribbbles_url)
    doc = Nokogiri::HTML(open("https://dribbble.com/#"))

    dribbbles = []

    doc.css('.main-full ol.dribbbles li.group').each do |dribbble|
      title = dribbble.css("a.dribbble-over").search('strong').text
      comment = dribbble.css("a.dribbble-over").search("span.comment").text
      shot_url = dribbble.at("a.dribbble-over").attr('href')
      designer_url = dribbble.at("a.hoverable.url").attr('href')
      designer_name = dribbble.at("a.hoverable.url").text.strip

      dribbbles << {title: title, comment: comment, shot_url: shot_url, designer_url: designer_url, designer_name: designer_name}
    end
    dribbbles
   # binding.pry
  end

  def self.scrape_designer(designer_url)
    doc = Nokogiri::HTML(open(designer_url))

    designers = []

    doc.css('.main-full.floating-sidebar-container.group').each do |designer|
      name = designer.at("a.url").text.strip
      location = designer.at("span.locality").text
      bio = designer.at(".bio").text
      skills = designer.css("ul.skills-list").search("a").map(&:text)
      teams = designer.css("ul.profile-details.on-teams").search("a").map(&:text).map(&:strip)

      designers << {name: name, location: location, bio: bio, skills: skills, teams: teams}
    end
    designers
   # binding.pry
  end

  def self.scrape_designer_links(designer_url)
    doc = Nokogiri::HTML(open(designer_url))

    designer_hash = {}

    designer_hash[:profile_url] = ("h2.vcard a.url").attr('href').text.prepend("https://dribbble.com")

    on_the_web = doc.css("ul.profile-details").search("a").map {|link| link.attribute("href").text }
      on_the_web.each do |link|
        if link.include?("playbook")
          designer_hash[:playbook] = link
        elsif link.include?("twitter")
          designer_hash[:twitter] = link
        elsif link.include?("instagram")
          designer_hash[:instagram] = link
        else
          designer_hash[:web] = link
        end
      end
    designer_hash
    # binding.pry
  end

end
