require 'tty-prompt'

class Movie
    attr_accessor :title, :rating, :genre
    def initalize(title, rating, genre)
        @title = title
        @rating = rating
        @genre = genre
    end
end

# Initialise 'TTY-Prompt'
prompt = TTY::Prompt.new

keep_program_running = true

while keep_program_running == true
    user_choice = prompt.select("Please choose which function you'd like to use:", user_options)

    if user_choice == ""

    end


    user_selection = prompt.yes?('Keep using movie helper?')
    if user_selection != "Y"
        keep_program_running = false
    end

end
##### >>> Object marshaling for saving across terminal sessions
# if File.file?('movies.dump')
#     ### loads movies array if it exists
#     $ports = Marshal.load(File.read('user.dump'))
#     puts `clear`
#     # userMenu()
# else 
#     ### else creates a new array
#     $movies = []
#     puts `clear`
#     newUser()
# end

# # saves the array of movies to "movies.dump"
# File.open('movies.dump', 'w') { |f| f.write(Marshal.dump($movies)) }
