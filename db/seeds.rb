# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Team Indiana
team_indiana = Team.create(name: "Indiana Panther Weightlifting", location: "Center Grove, Indiana")
# Create workouts Cats/subcats/exercises for Team Indiana

# Create rufus' account
rufus = User.create(team: team_indiana, name: "Mr. Rufus", email: "rufus@email.com", password: "password", role: "Coach" )
will = User.create(team: team_indiana, name: "Will Reilly", email: "will@email.com", password: "password", role: "Athlete")
# Create admin account
admin = User.create(name: "Administrator", email: "admin@email.com", password: "password", role: "Admin")
# Create example account
team_example = Team.create(name: "Example Team", location: "Somewhere, USA")
team_example.save
example = User.create(team: team_example, name: "First Last", email: "example@email.com", password: "example", role: "Athlete")
example.save
example_coach = User.create(team: team_example, name: "Head Coach", email: "coach@email.com", password: "coach", role: "Coach")
example_coach.save

example_categories = [["Free Weights", "FW"], ["Conditioning", "Cond"], ["Body Weight", "BW"], ["Warm Ups", "WU"]]

example_categories.each do |cat|
  c = Category.create(name: cat[0], abbreviation: cat[1], team: team_example)
  for i in 1..5 do
    subcat = Subcategory.create(name: "Subcat Name #{i}", rank: i, category: c)
    for j in 1..5 do
      Exercise.create(name: "Exercise #{j} for Subcat #{i}", nickname: "Shrt Nm #{i}#{j}", subcategory: subcat)
    end
  end
end
