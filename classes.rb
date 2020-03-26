class Movie
    attr_accessor :title, :rating, :genre
    def initialize(title, genre="", rating="")
        @title = title
        @rating = rating
        @genre = genre
    end
end