class NoStarchPress::Topic
  
  attr_accessor :name, :url, :books 
  @@all = []
  
  def initialize(name = nil, url = nil, books = [])
    @name = name
    @url = url
    @books = []
    @@all << self
  end 
  
  def self.all
    puts "Welcome to No Starch Press - the finest in geek entertaiment!" 
    
    topic_1 = self.new  
    topic_1.name = "Ardruino"
    topic_1.url = "https://nostarch.com/catalog/arduino"
    topic_1.books = ["book_1", "book_2"]
    
    topic_2 = self.new  
    topic_2.name = "Art & Design"
    topic_2.url = "https://nostarch.com/catalog/art-photography-design"
    topic_2.books = ["book_3", "book_4"]
    
    @@all
  end 
  
end