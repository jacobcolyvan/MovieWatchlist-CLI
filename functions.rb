require_relative './control.rb'
require_relative './classes.rb'

def new_movie(title)
    movieWatchlist.push(Movie.new(title))
end