# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
Firm.delete_all
Case.delete_all
Giver.delete_all
User.delete_all

# Create the firms
puts "Creating firms..."
mckinsey = Firm.create(name: "McKinsey")
bcg = Firm.create(name: "BCG")
bain = Firm.create(name: "Bain")
deloitte = Firm.create(name: "Deloitte")
kellogg = Firm.create(name: "Kellogg")

# Create the givers
puts "Creating givers..."
bugayong = Giver.create(name: "Elizabeth Bugayong", email: "ebugayong2015@kellogg.northwestern.edu")
jelinek = Giver.create(name: "Ashley Jelinek", email: "ajelinek2015@kellogg.northwestern.edu")
mann = Giver.create(name: "Ryan Mann", email: "rmann2015@kellogg.northwestern.edu")

# Create the cases
puts "Creating cases..."
orrington = Case.create(firm: kellogg, giver: bugayong, name: "Orrington Office Supplies", image: "Orrington.jpg", summary: "Determine how to optmize profitability for an office supplies company in preparation for an acquisition by a PE firm.", difficulty: "Medium", topic: "Profitability")
oil = Case.create(firm: mckinsey, giver: jelinek, name: "Big Oil", image: "Oil.jpg", summary: "Take a journey to understand why the number of gas stations is declining for our client, Big Oil.", difficulty: "Hard", topic: "Profitability")
jt = Case.create(firm: bain, giver: mann, name: "JT's Energy Drinks", image: "Energy.jpg", summary: "Provide our client with suggestions for how to optimize its marketing mix of products.", difficulty: "Hard", topic: "Marketing")

# Create users
User.create(name: "Brian Eng", email: "b-eng@kellogg.northwestern.edu", password: "secret")

puts "There are now #{Firm.count} firms, #{Case.count} cases, #{Giver.count} case givers, and #{User.count} users in the database."
