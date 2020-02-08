class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    @song = self.new(song_name)
    @song.artist_name = artist_name
    @song
  end

  def artist_name=(name)
      artist = self.find_or_create_by_name(name)
      self.artist = artist
      artist.add_song(self)
  end

end
