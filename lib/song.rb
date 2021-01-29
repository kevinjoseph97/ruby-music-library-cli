class Song 

    attr_accessor :name 
    attr_reader :artist, :genre 

    @@all = []

    def initialize(name, artist= nil, genre= nil)
        @name = name 
        if artist 
            self.artist = artist
        end
        if genre 
            self.genre = genre
        end

    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end


    def self.all 
        @@all 
    end

    def self.destroy_all
        @@all.clear
    end
    
   
    def save
        self.class.all << self
    end

    def self.create(name)
        new_song = self.new(name)
        new_song.save
        new_song
    end

    def self.find_by_name(name)
        self.all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        return self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(filename)
        array = filename.split(/ - |\./)
        a_t = Artist.find_or_create_by_name(array[0])
        g_t = Genre.find_or_create_by_name(array[2])
        s_t = array[1]
        new_song = Song.new(s_t, a_t, g_t)
        new_song 
    end

    def self.create_from_filename(filename)
        new_song = self.new_from_filename(filename)
        new_song.save
        new_song
    end




end 
