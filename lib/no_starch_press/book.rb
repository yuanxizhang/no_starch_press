class NoStarchPress::Book
  attr_accessor :title, :url, :author, :release_date, :topic 
  @@all = []
  
  def initialize(title = nil, url = nil, author = nil, release_date = nil, topic = nil)
    @title = title
    @url = url
    @author = author
    @release_date = release_date
    @topic = topic
    @@all << self
  end 
  
  def self.all
    @@all
    
    puts "1. The Ardruino inventors Guide"
    puts "2. Ardruino Playground"
    puts "3. Ardruino Workshop"
  end 
  
end