class NoStarchPress::CLI 
  def call 
    list_topics
    menu
    goodbye
  end 
  
  def list_topics
    @topics = NoStarchPress::Topic.all
  end 
  
  def menu 
    
    input = nil 
    while input != "exit"
      puts "Enter a number for the topic you want, type list to see all topics or type exit to leave: "
      input = gets.strip.downcase
      case input
      when "1"
        puts "Books on Arduino:"
      when "2"
        puts "Books on Art and Design:"
      when "3"
        puts "Books on General Computing:"
      when "list"
        list_topics
      when "exit"
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