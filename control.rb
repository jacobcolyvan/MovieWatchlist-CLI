
class Movie
    attr_accessor :title, :rating, :genre
    def initalize(title, rating, genre)
        @title = title
        @rating = rating
        @genre = genre
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
