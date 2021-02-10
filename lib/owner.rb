#require 'pry'
class Owner
  attr_accessor :mood
  attr_reader :name, :species 

  @@all=[]

  def initialize (name, species="human")
    @name = name
    @species = species
    @@all << self
  end

  def cats
    Cat.all.select {|el| el.owner == self}  
  end

  def dogs
    Dog.all.select {|el| el.owner == self}  
  end

  def buy_cat(name)
    
    new_cat = Cat.new(name, self.name)
    new_cat.owner = self
  end

  def buy_dog(name)
    #binding.pry
    new_dog = Dog.new(name, self.name)
    new_dog.owner = self
  end

  def walk_dogs
    #binding.pry
    self.dogs.collect {|dog| dog.mood = "happy"} 
  end

  def feed_cats
    self.cats.collect {|cat| cat.mood = "happy"} 
  end

  def sell_pets
    self.dogs.collect {|dog| dog.mood = "nervous"}
    self.cats.collect {|cat| cat.mood = "nervous"}
    self.dogs.collect {|dog| dog.owner = nil}
    self.cats.collect {|cat| cat.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)." 
  end

  def say_species
    "I am a human."
  end

  def self.count
    @@all.count
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

end