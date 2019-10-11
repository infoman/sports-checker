# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Team.count == 0 && Player.count == 0
  ActiveRecord::Migration.say_with_time 'Populating players and teams…' do
    ActiveRecord::Base.transaction do
      team_names = [
        'Fishing Rod Fighters',
        'King Cream',
        'Between the Wood Shavings and Me',
        'One Girl, One Thousand Wood Shavings',
        'Wood Shavings One Thousand',
        'Spiffing Owls of Devon',
        'The Spiffing Heroes of Devon',
        'Spiffingknot',
        'The Fishing Rod Owls',
        'Taking Back Autumn'
      ]
      teams = Team.create!(team_names.map {|name| { name: name } })

      player_names = [
        'Eulalia Gauthier',
        'Deidra Havel',
        'Gertrude Hardiman',
        'Sam Roos',
        'Lavonia Eaton',
        'Saturnina Elias',
        'Amber Broman',
        'Willis House',
        'Drucilla Phalen',
        'Retha Rodrigez',
        'Kera Pugh',
        'Noreen Tallman',
        'Sharron Gayle',
        'Lizzie Gholson',
        'Giselle Deloney',
        'Waylon Holtkamp',
        'Natalie Cho',
        'Kristan Cartee',
        'Ardith Hobbs',
        'Barbra Freas',
        'Renetta Rink',
        'Katelin Chancey',
        'Siu Goodwin',
        'Mabelle Saracino',
        'Delilah Blades',
        'Serita Baynes',
        'Mechelle Eddleman',
        'Daniela Paulhus',
        'Euna Montagna',
        'Antone Harjo',
        'Shelli Gisler',
        'Vonda Knobel',
        'Tora Hohler',
        'Loan Gideon',
        'Maryalice Hennig',
        'Dell Haga',
        'Precious Devalle',
        'Gertie Burkhardt',
        'Estefana Tirrell',
        'Coreen Laino',
        'Stefany Thorman',
        'Anja Hedgecock',
        'Lakia Hillhouse',
        'Jestine Mckennon',
        'Dorethea Landa',
        'Nubia Dick',
        'Abdul Meldrum',
        'Shannon Mayor',
        'Theresia Presswood',
        'Tera Duenes',
        'Will Obando',
        'Meghan Fabiani',
        'Deandra Outler',
        'Jae Ruiz',
        'Andrew Rising',
        'Milissa Walk',
        'Gene Hymel',
        'Mitzi Brimmer',
        'Ashli Plascencia',
        'Chia Mcniel',
        'Raphael Deardorff',
        'Jim Laracuente',
        'Celestina Adam',
        'Heather Asbell',
        'Miguel Holub',
        'Krysta Krikorian',
        'Lolita Rakow',
        'Brendon Cuccia',
        'Octavia Schlabach',
        'Iraida Testa'
      ]

      to_team = 0
      player_names.each_slice(7) do |names|
        Player.create!(names.map {|name| { team: teams[to_team], name: name } })
        to_team += 1
      end
    end
  end
end

if Match.count == 0
  ActiveRecord::Migration.say_with_time 'Populating matches…' do
    ActiveRecord::Base.transaction do
      locations = [
        'St Les',
        'San Northlou',
        'Mslowneyldon',
        'Torbridgebridge',
        'Bealonforth',
        'Santa Rniamath',
        'Park Fearstang',
        'Sleephill',
        'Elchladetree',
        'Port Abtif'
      ]
      teams = Team.all

      locations.each do |location|
        participants = teams.sample(2).map do |team|
          MatchParticipant.new team: team, score: rand(10)
        end
        Match.create! location: location, participants: participants, created_at: rand(1.year).seconds.ago
      end
    end
  end
end

if Counter.count == 0 && Achievement.count == 0
  ActiveRecord::Migration.say_with_time 'Populating counters and achievements definitions…' do
    ActiveRecord::Base.transaction do
      counters = Counter.create([
        { name: 'goals' },
        { name: 'assists' },
        { name: 'passes' },
        { name: 'successful_passes', unit: '%' },
        { name: 'running_distance', unit: 'km' }
      ])

      Achievement.create!([
        {
          name: 'made_goal',
          counter: counters[0],
          threshold: 1
        },
        {
          name: 'made_5_assists',
          counter: counters[1],
          threshold: 5
        },
        {
          name: 'made_10_passes',
          counter: counters[2],
          threshold: 10
        },
        {
          name: 'made_70_percent_successful_passes',
          counter: counters[3],
          threshold: 70
        },
        {
          name: 'ran_10_km',
          counter: counters[4],
          threshold: 10
        }
      ])
    end
  end
end
