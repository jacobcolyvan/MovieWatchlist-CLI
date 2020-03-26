require 'tty-prompt'
require_relative './classes.rb'


### Object marshaling for saving across terminal sessions
if File.file?('movies.dump')
    ### loads movies array if it exists
    $moviesWatchlist = Marshal.load(File.read('movies.dump'))
    
else 
    ### else creates a new array
    $moviesWatchlist = [Movie.new("Godfather", "Drama")]
end


def newMovie(title, genre)
    $moviesWatchlist.push(Movie.new(title, genre))
end

def showMovies()
    $moviesWatchlist.each do |movie|
        puts movie.title
    end
end

def showRandomMovie()
    puts "The movie you should watch is: #{$moviesWatchlist[rand(0..$moviesWatchlist.length)].title}"
end

def genreList()
    genreArray = []
    $moviesWatchlist.each do |movie|
        if !genreArray.include?(movie.genre)
            genreArray.push(movie.genre)
        end
    end
    genreChoice = prompt.select("Choose a genre", genreArray)
    tempList = []
    $moviesWatchlist.each do |movie|
        if movie.genre == genrechoice
            tempList.push(movie)
        end
    end

    puts `clear`
    puts "Here's ya list mate"
    puts tempList
    puts 
end

# Initialise 'TTY-Prompt'
prompt = TTY::Prompt.new
keep_program_running = true
user_options = ["Show all movies", "Add movie to list", "Choose random movie", "Show movies of genre type"]


# Control loop - program keeps asking us what function we'd like to use until we decide to exit
while keep_program_running
    puts `clear`
    user_choice = prompt.select("Please choose which function you'd like to use:", user_options)
    # Show all movies in the list
    if user_choice == "Show all movies"
        showMovies()
    # The user can add a new movie that isn't already on the movie list
    elsif user_choice == "Add movie to list"
        title = prompt.ask("What movie do you want to add? ")
        genre = prompt.ask("What genre is it? ")
        newMovie(title, genre)
    # The user is given a random movie from the list of movies
    elsif user_choice == "Choose random movie"
        showRandomMovie()
    elsif user_choice == "Show movies of genre type"
        genreList() 
    end

    if prompt.yes?('Keep using movie helper?') == false
        ### saves the array of movies to "movies.dump"
        File.open('movies.dump', 'w') { |f| f.write(Marshal.dump($moviesWatchlist)) }
        keep_program_running = false
    end
end


