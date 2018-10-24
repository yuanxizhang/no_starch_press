class NoStarchPress::CLI
  def call
    scrape_topic
    list_topics
    menu
    goodbye
  end

  def scrape_topic
    NoStarchPress::Scraper.scrape_topics
  end

  def list_topics

    NoStarchPress::Topic.all.each.with_index(1) do |topic, i|
      puts "Topic #{i}. #{topic.name}"

    end
  end

  def menu
    puts "Welcome to No Starch Press - the finest in geek entertaiment!"

    input = nil
    while input != "exit"
      puts "Enter a number for the topic you want, type list to see all topics or type exit to leave: "
      input = gets.strip.downcase
      if input.to_i > 0 and input.to_i <= NoStarchPress::Topic.all.count
        NoStarchPress::Scraper.get_books(NoStarchPress::Topic.all[input.to_i - 1]) if NoStarchPress::Topic.all[input.to_i - 1].books.count == 0

        puts "There are #{NoStarchPress::Topic.all[input.to_i - 1].books.count} "+ NoStarchPress::Topic.all[input.to_i - 1].name + " books: "

        NoStarchPress::Topic.all[input.to_i - 1].books.each.with_index(1) do |book, i|
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