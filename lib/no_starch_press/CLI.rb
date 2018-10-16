class NoStarchPress::CLI 
  def call 
    list_topics
    menu
    goodbye
  end 
  
  def list_topics
    @topics = NoStarchPress::Topic.scrape_topics
    @topics.each.with_index(1) do |topic, i| 
      puts "#{i}. #{topic.name}"
    end
  end 
  
  def list_books_by_topic
  end  
  
  def menu 
    puts "Welcome to No Starch Press - the finest in geek entertaiment!" 
    
    input = nil 
    while input != "exit"
      puts "Enter a number for the topic you want, type list to see all topics or type exit to leave: "
      input = gets.strip.downcase
      if input.to_i > 0
        puts @topics[input.to_i - 1].name + " books: "
        puts @topics[input.to_i - 1].books.each {|book| book.title}
        # books_by_topic = @topics[input.to_i - 1].books.select {|book| book.topic == @topics[input.to_i - 1]}
        # books_by_topic.each.with_index(1) {|book, i| puts "#{i}. " + book.title}
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