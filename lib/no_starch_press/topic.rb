class NoStarchPress::Topic
  
  attr_accessor :name, :url, :books 
  @@all = []
  
  def initialize(name = nil, url = nil, books = [])
    @name = name
    @url = url
    @books = []
    
  end 
  
  def self.first2
    # # puts "Welcome to No Starch Press - the finest in geek entertaiment!" 
    doc = Nokogiri::HTML(open("https://nostarch.com/"))
    
    topic_1 = self.new  
    topic_1.name = doc.css("div.views-field span.field-content a")[0].text.strip
    topic_1.url = "https://nostarch.com/"
    topic_1.books = [NoStarchPress::Book.all[0], NoStarchPress::Book.all[1]]
    
    topic_2 = self.new 
    topic_2.name = doc.css("div.views-field span.field-content a")[1].text.strip
    topic_2.url = "https://nostarch.com/"
    topic_2.books = [NoStarchPress::Book.all[0], NoStarchPress::Book.all[1]]
    
    [topic_1, topic_2]
  end 
  
  def self.all 
    @@all 
  end
  
  def self.clear_all 
    @@all.clear
  end 
  
  def self.scrape_topics
    doc = Nokogiri::HTML(open("https://nostarch.com/"))
    
    doc.css("div.views-field span.field-content a").each do |element|
      topic = self.new
      topic.name = element.text.strip
      topic.url = "https://nostarch.com/#{element["href"]}"
      @@all << topic
    end 
    
    @@all
  end 
  
end