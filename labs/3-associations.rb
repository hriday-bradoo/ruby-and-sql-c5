# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts
darth = Salesperson.find_by({"first_name"=>"Darth"})
tim = Contact.find_by({"first_name"=>"Tim"})
luke = Contact.find_by({"first_name"=>"Luke"})

activity = Activity.new
activity["contact_id"] = tim["id"]
activity["salesperson_id"] = darth["id"]
activity["notes"] = "first meeting with Tim"
activity.save

activity = Activity.new
activity["contact_id"] = tim["id"]
activity["salesperson_id"] = darth["id"]
activity["notes"] = "second meeting with Tim"
activity.save

activity = Activity.new
activity["contact_id"] = luke["id"]
activity["salesperson_id"] = darth["id"]
activity["notes"] = "first meeting with the jedi"
activity.save

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

puts "Activities between Darth Vader and Tim Cook:"
activities = Activity.where({"salesperson_id" => darth["id"], "contact_id" => tim["id"]})

for activity in activities
    note = activity["notes"]
    puts "- #{note}"
end

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
