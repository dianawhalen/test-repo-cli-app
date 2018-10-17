BASE_PATH = "https://cartrdge.com/"

DRIBBBLES PAGE
Nokogiri::HTML(open("https://dribbble.com/#"))
	⁃	Dribbbles (array) {
	  	⁃	Title (string)
	  	⁃	Comment (string)
	  	⁃	Designer Name (string)
	  	⁃	Shot Url (string)
	  	⁃	Designer Url (string) }

dribbbles.map {|x,y| puts x[:designer_url] }

DESIGNER PAGE
Nokogiri::HTML(open(designer_url))
	⁃	Designer (hash)
  	⁃	Name (string)
  	⁃	Location (string)
		⁃	Bio (string)
  	⁃	Skills (array)
  	⁃	Teams (array)
    	⁃	Team Name (string)
    	⁃	Team Link (string)
  	⁃	On The Web (hash)
  	⁃	Shots (array)

SHOT PAGE
Nokogiri::HTML(open(shot_url))
	⁃	Shot (hash)
  	⁃	Shot Name (string)
  	⁃	Designer Name (string)
  	⁃	Shot Date (string)
  	⁃	Description (heredoc)
  	⁃	Tags (array)
		⁃	Views (integer)
------------------------------------------------------------------------------
How to build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure - Google
3. Start with the entry point - the file run
4. Force that to build the CLI
5. Stub out the interface
6. Start making things real
7. Discover objects
8. Program

A command line interface for listing Indie Video Games and details about the projects and their creators.

User types indie-games

Show a list of projects

1. This Project
2. That Project

Which Project do you want to learn more about?

1

What is a Project?

A Project has:
	⁃ a title
	⁃	an application category
	⁃	an operating system
	⁃	genres
	⁃	collaborators
	⁃	a URL
		⁃	followers
		⁃	a description
		⁃	software
		⁃	platforms
		⁃	controls
		⁃	an engine
		⁃	tags
		⁃	connect links
		⁃	play links
		⁃	support links
		⁃	a release date
