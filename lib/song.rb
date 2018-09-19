require 'pry'


class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
    #binding.pry
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
    #binding.pry
  end


  def self.find_by_name(name)

    if @@all.empty? == false
      @@all.each do |song|
        if song.name == name
          #binding.pry
          return song
        end
      end
    end
      #binding.pry
    nil

  end

  def self.alphabetical

  @@all.sort_by { |song| song.name}

  end

  def self.new_from_filename(file_name)
    whithout_mp3 = file_name.chomp(".mp3")
    artist_name = whithout_mp3.split("-")

    binding.pry

    artist = name_artist[0]
    name = name_artist[1]

    song_added = self.create_by_name(name)
    song_added.artist_name = artist
  end







  def self.find_or_create_by_name(name)
    #binding.pry
  self.find_by_name(name) || self.create_by_name(name)

  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
