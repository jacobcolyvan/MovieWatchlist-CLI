require "tty-prompt"
require "tty-font"

require_relative "./classes.rb"
require_relative "./functions.rb"
prompt = TTY::Prompt.new
loadFile()
# wantToWatch = []

user_options = [
    "Show all movies", "Add movie to list", 
    "Choose random movie", "Show movies of genre type"
]


# Control loop
keep_program_running = true
while keep_program_running
    puts `clear`
    user_choice = prompt.select("Please choose which function you'd like to use:", user_options)
    
    case user_choice
    when "Show all movies"
        showMovies()
    when "Add movie to list"
        title = prompt.ask("What movie do you want to add? ")
        genre = prompt.ask("What genre is it? ")
        newMovie(title, genre)
    when "Choose random movie"
        showRandomMovie()
    when "Show movies of genre type"
        genreList() 
    end

    puts 
    if !prompt.yes?('Keep using movie helper?')
        ### saves the array of movies to "movies.dump"
        File.open('movies.dump', 'w') { |f| f.write(Marshal.dump($moviesWatchlist)) }
        keep_program_running = false
    end
end


