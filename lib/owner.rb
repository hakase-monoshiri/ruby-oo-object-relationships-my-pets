class Owner
  
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    self.class.all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(cat)
    new_cat = Cat.new(cat, self)
  end

  def buy_dog(dog)
    new_dog = Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.collect{|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.collect{|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.collect do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.dogs.collect do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

    
  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end


end