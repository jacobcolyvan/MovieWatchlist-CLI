require_relative './control.rb'
require_relative './classes.rb'

def newMovie(title)
    $moviesWatchlist.push(Movie.new(title))
end

def showMovies()
    $moviesWatchlist.each do |movie|
        puts movie.title
    end
end

def showRandomMovie()
    puts $moviesWatchlist[rand(0..$moviesWatchlist.length)].titles
end