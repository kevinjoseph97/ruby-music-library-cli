class Artist 

    extend Concerns::Findable


    attr_accessor :name, :songs
    @@all = []
    


    def initialize(name)
        @name = name 
        @songs = []
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
        new_artist = self.new(name)
        new_artist.save
        new_artist
    end

    def add_song(song)
        if !self.songs.include?(song)
            self.songs << song
        end
        if !song.artist
            song.artist = self
        end
    end

    def genres
        self.songs.map{|song| song.genre}.uniq
    end

end

