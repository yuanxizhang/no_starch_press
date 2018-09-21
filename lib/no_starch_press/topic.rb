class NoStarchPress::Topic
  
  attr_accessor :name, :url, :books 
  @@all = []
  
  def initialize(name = nil, url = nil, books = nil)
    @name = name
    @url = url
    @books = []
    @@all << self
  end 
  
  def self.all
    puts "Welcome to No Starch Press - the finest in geek entertaiment!" 
    
    topic_1 = self.new  
    topc_1.name = "Ardruino"
    topc_1.url = "https://nostarch.com/catalog/arduino"
    topc_1.books = ["The Ardruino Inventors Guide", "Ardruino Playground", "Ardruino Workshop"]
    
    topic_2 = self.new  
    topc_2.name = "Art & Design"
    topc_2.url = "https://nostarch.com/catalog/art-photography-design"
    topc_2.books = ["The Art of Interactive Design", "Game Art", "Art of the Brick"]
    
    @@all << topic_1 
    @@all << topic_2 
    @@all
  end 
  
end