class Owner
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
  end
  def say_species
    "I am a #{species}."
  end
  def self.all
    @@all
  end
  def self.count
    @@all.count
  end
  def self.reset_all
    @@all.clear
  end
  def cats
    Cat.all.select {|cat_object| cat_object.owner == self}
  end
  def dogs
    Dog.all.select {|dog_object| dog_object.owner == self}
  end
  def buy_cat(cat_name)
    cat_name = Cat.new(cat_name, self)
    cats
  end
  def buy_dog(dog_name)
    dog_name = Dog.new(dog_name, self)
    dogs
  end
  def walk_dogs
    dogs.each {|dog_object| dog_object.mood = 'happy'}
  end
  def feed_cats
    cats.each {|cat_object| cat_object.mood = 'happy'}
  end
  def sell_pets
    cats.each do |cat_object|
       cat_object.owner = nil
       cat_object.mood = 'nervous'
    end
    dogs.each do |dog_object| 
      dog_object.owner = nil
      dog_object.mood = 'nervous'
    end
  end
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end