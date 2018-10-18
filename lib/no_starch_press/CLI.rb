class NoStarchPress::CLI 
  def call 
    scrape_topic
    list_topics
    menu
    goodbye
  end 
  
  def scrape_topic
    NoStarchPress::Topic.scrape_topics
  end 
  
  def list_topics
    @topics = NoStarchPress::Topic.all
    @topics.each.with_index(1) do |topic, i| 
      puts "Topic #{i}. #{topic.name}"
      
    end
  end
  
  def menu 
    puts "Welcome to No Starch Press - the finest in geek entertaiment!" 
    
    input = nil 
    while input != "exit"
      puts "Enter a number for the topic you want, type list to see all topics or type exit to leave: "
      input = gets.strip.downcase
      if input.to_i > 0 
        books_by_topic = @topics[input.to_i - 1].books.select {|book| book.topic == @topics[input.to_i - 1]}
        puts "There are #{books_by_topic.count} "+ @topics[input.to_i - 1].name + " books: "
        
        books_by_topic.each.with_index(1) do |book, i| 
          puts "Book #{i}. " + book.title 
          puts "           " + book.url
        end
      elsif input == "list"
        list_topics
      elsif input == "exit"
        break
      else 
        puts "Not sure which topic you want, type list or exit: "
      end
    end 
  end
  
  def goodbye
    puts "See you later for another book search!"
  end
end