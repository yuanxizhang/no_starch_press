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
    
    book_1 = self.new  
    book_1.title = "The Ardruino Inventors Guide"
    book_1.url = "https://nostarch.com/arduinoinventor"
    book_1.author = "by Brian Huang and Derek Runberg"
    book_1.release_date = "June 2017, 336 pp."
    book_1.topic = topic_1
    
    book_2 = self.new  
    book_2.title = "Ardruino Playground"
    book_2.url = "https://nostarch.com/arduinoplayground"
    book_2.author = "by Warren Andrews"
    book_2.release_date = "March 2017, 344 pp."
    book_2.topic = topic_1
    @@all
  end 
  
end