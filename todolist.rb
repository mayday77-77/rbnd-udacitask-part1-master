class TodoList
    # methods and stuff go here
    attr_reader :title, :items, :owner
    attr_accessor :title
    # Initialize todo list with a title and no items
    # Added owner attribute for feature #2
    def initialize(owner , list_title)
       @title = list_title
       @owner = owner
       @items = Array.new # Starts empty! No Items yet!
    end

    # pass in hash options
    def add_item(new_item, options = {})
        item = Item.new(new_item, options)
        @items.push(item)
    end

    def print_list
    	puts "\n*************************"
    	puts "#{@owner}: #{@title}"
    	puts "*************************"
   		@items.each {|each_item| each_item.print_items}
    end

    def print_save
    	x =[("\n*************************\n"),
    	"#{@owner}: #{@title}\n",
    	"*************************\n"]
   		#@items.each {|each_item| each_item.print_items}
   		return x
    end

    def remove_item(position)
    	# since index starts from 0, subtract 1 to get the correct position
    	@items.delete_at(position-1)
    end

   	def update_item_complete(position)
   		@items[position-1].update_complete
   	end

   	def update_title(new_title)
   		@title = new_title
   	end

   	# not in use yet
   	def marked_item(position)
   		@items[position-1].marked?
   	end
end

class Item
    # methods and stuff go here
    attr_reader :description, :completed_status, :due_date, :start_time, :end_time
    attr_accessor :completed_status

    # pass in hash options
    # added due date, start/end time for feature #1
    def initialize(item_description, options = {})
    	@description = item_description
    	@completed_status = false
    	# Assign N/A if no vales are passed in
    	@due_date = options[:due_date] || "N/A"
    	@start_time = options[:start_time] || "N/A"
    	@end_time = options[:end_time] || "N/A"
    end

    def update_complete
    	@completed_status = true
    end

    def print_items
    	# assign icon : [X] if true and [ ] if false using marked?
    	icon = marked? ? "[X]" : "[ ]" 
    	puts "#{icon} -- #{@description}\n\t==> Due Date: #{@due_date}, Start Time: #{start_time}, End Time: #{end_time}"
    end

    #  method that returns a boolean using the ? naming convention
    def marked?
    	@completed_status
    end

end

# Feature 3
# Save the list to a file, and load the list file if one already exists.
# create a new MyFile object
class MyFile
	attr_accessor :files

	def initialize
		#@files = Array.new
		@files = Hash.new
	end

	def save_file(to_do_list_obj)
		# store the original stdout
		original_stdout = $stdout.dup
		# redirect stdout to file (overwrites existing file)
		$stdout.reopen(File.new("#{to_do_list_obj.owner}.txt", "w+"))
		to_do_list_obj.print_list
		# restore the stdout
		$stdout.reopen(original_stdout)
		@files[to_do_list_obj.owner] = ("#{to_do_list_obj.owner}.txt")
	end

	def load_file(list_owner)
		# simple check to see if name given already exist in the @files
		if @files.has_key?(list_owner)
			# Check again to see if physical file exits
			if File.exist?(@files[list_owner])
				puts File.read("#{@files[list_owner]}")
			else
				puts "\nFile is missing!"
			end
		else
			puts "\nNo such owner/file exists!"
		end
	end

end

