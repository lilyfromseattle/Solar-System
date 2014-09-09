class SolarSystem
  attr_accessor :formation_date
  def initialize(formation_date)
    @formation_date = formation_date
    @planets = []
  end

  def year(planetname)
    for planet in @planets
      if planet.name == planetname
        days = (2014 - @formation_date)* 365
        years = days / planet.rotation_rate
        puts "#{planet.name} is #{years} years old."
      end
    end
  end

  def info(planetname, planetattribute)
      puts "You would like to know the #{planetattribute} of #{planetname}!"
  end

  def return_info(planetname, planetattribute)
    for planet in @planets
      if planet.name == planetname
      
        if planetattribute.downcase == "location"
          puts "#{planetname.capitalize} is located to the #{planet.location}."
        elsif planetattribute.downcase == "size"
          puts "#{planetname.capitalize} is #{planet.size}."
        elsif planetattribute.downcase == "climate"
          puts "#{planetname.capitalize} has a #{planet.climate} climate."
        elsif planetattribute.downcase == "moons" or planetattribute.downcase == "number of moons"
          puts "#{planetname.capitalize} has #{planet.location.to_s} moons."
        elsif planetattribute[0..2].downcase == "rot" or planetattribute[0..3].downcase == "rate"
          puts "#{planetname.capitalize} has a rotation rate of #{planet.location} days."
        elsif planetattribute.downcase == "exit"
          put "Goodbye!"
          exit(0)
        else
          puts "We do not have that information."
        end
      end
    end
  end


  def make_planets(some_array)
    some_array.each do |hash|
      @planets << Planet.new(hash)
      puts "The planet #{hash[:name]} was created."
    end
  end

    class Planet
      attr_accessor :name, :location, :size, :climate, :moons, :rotation_rate
      def initialize(hash)
        @name = hash[:name]
        @location = hash[:location]
        @size = hash[:size]
        @climate = hash[:climate]
        @moons = hash[:moons]
        @rotation_rate = hash[:rotation_rate]
      end

      def name
        @name
      end
    end
end

planets = [{name: "Planet A", location: "East", size: "very big", climate: "desert", moons: 8, rotation_rate: 200},
            {name: "Planet B", location: "West", size: "medium sized", climate: "tundra", moons: 2, rotation_rate: 100},
            {name: "Planet C", location: "South", size: "very small", climate: "tropical", moons: 3, rotation_rate: 50}]

my_solar_system = SolarSystem.new(2000)
my_solar_system.make_planets(planets)

puts "Welcome to the solar system information center!"
planet_choice = ""
topic = ""
while true
  puts "What planet would you like to learn about? (Planet A, Planet B, or Planet C)"
  planet_choice = gets.chomp
  if planet_choice.downcase == "exit" or topic.downcase == "exit"
    puts "Goodbye!"
    exit(0)
  elsif planet_choice.downcase == "planet a" or planet_choice.downcase == "planet b" or planet_choice.downcase == "planet c"
    planet_choice = planet_choice.split.map(&:capitalize).join(' ')
    puts "What would you like to know about #{planet_choice}? (location, size, climate, moons, rotation rate)"
    topic = gets.chomp

    my_solar_system.return_info(planet_choice, topic)
  else
    puts "That's not a planet in this solar system."
  end
end
