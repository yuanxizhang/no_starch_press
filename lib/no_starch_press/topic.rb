class NoStarchPress::Topic
  
  attr_accessor :name, :url, :books
  
  @@all = []
  
  def initialize(name = nil, url = nil, books = [])
    @name = name
    @url = url
    @books = []
  end
  
  def self.all 
    @@all.uniq 
  end
  
  def self.clear_all 
    @@all.clear
  end 
  
  def self.scrape_topics
    self.clear_all
    doc = Nokogiri::HTML(open("https://nostarch.com/"))
    
    doc.css("div.views-field span.field-content a").each do |element|
      topic = self.new
      topic.name = element.text.strip
      topic.url = "https://nostarch.com#{element.attribute("href").text}"
      topic.books = topic.get_books
      @@all << topic if ( topic.name != "Gift Certificates" and (not @@all.include?(topic)))
    end 
    
    @@all.uniq
  end 
  
  def get_books
    @books.clear
    doc = Nokogiri::HTML(open(@url))
    
    doc.css("div.product-title a").each do |element|
      book = NoStarchPress::Book.new
      book.title = element.text.strip
      book.url = "https://nostarch.com#{element.attribute("href").text}"
      book.topic = self if book.topic == nil
    
      @books << book unless @books.include?(book)
    end
    @books.uniq
  end 
  
  def add_book(book)
    if book.topic == nil
      book.topic = self
    end
    
    unless @books.include?(book)
      @books << book
    end
  end
  
end