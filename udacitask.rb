require_relative 'todolist.rb'

# Creates a new todo list
my_list = TodoList.new("Edmund", "My Own To-Do list!")

# Add four new items
# And some fields we can choose to opt out
my_list.add_item("Pay your bills", due_date: "30-Mar", start_time: "15:00")
my_list.add_item("Do your work", due_date: "25-Mar", start_time: "14:00", end_time: "15:00")
my_list.add_item("Ride your bike", start_time: "13:00", end_time: "14:00")
my_list.add_item("Eat ice-cream", due_date: "26-Mar")

# Print the list
my_list.print_list

# Delete the first item
# Pass item number 1 on the list
my_list.remove_item(1)

# Print the list
my_list.print_list

# Delete the second item
# Pass item number 2 on the list
my_list.remove_item(2)

# Print the list
my_list.print_list

# Update the completion status of the first item to complete
# Update item number 1 on the list to complete/done
my_list.update_item_complete(1)

# Print the list
my_list.print_list

# Update the title of the list
my_list.update_title("My Renamed To-Do list!!")

# Print the list
my_list.print_list


# Extra Features
puts "\n*******************************Extra Features*************************************"
# Feature 1
# Added due date, start and end time to the Item class for a more comprehensive list
# Already implemented it as part of project above

# Feature 2
# Allow multiple users to create their own to-do lists
# To implement this, added an owner attribute to the TodoList class
# Already implemented it as part of project above
# Create a new list
my_list2 = TodoList.new("Vader", "My Own To-Do stuff!")
my_list2.add_item("Ride an e-scooter", due_date: "31-Mar", start_time: "10:00", end_time: "12:00")
my_list2.add_item("Go for quick meeting", start_time: "14:00", end_time: "15:00")

my_list.print_list
my_list2.print_list

# Feature 3
# Save the list to a file, and load the list file if one already exists.
# Create a new MyFile object in todolist.rb
puts "\n===== Saving file =========="
my_file = MyFile.new
# Save all item lists into this object
# Vheck that now 2 files are being saved with the owner as the name of the files
my_file.save_file(my_list)
puts "Saving file #{my_list.owner}.txt..."
my_file.save_file(my_list2)
puts "Saving file #{my_list2.owner}.txt..."

# Reloading file and output to screen
puts "\n===== Loading file =========="
my_file.load_file("Edmund")
my_file.load_file("Vader")

# Loading non existent file
my_file.load_file("Test")



