class NoStarchPress::Scraper
  def self.scrape_topics

    doc = Nokogiri::HTML(open("https://nostarch.com/"))

    doc.css("div.views-field span.field-content a").each do |element|
      topic = NoStarchPress::Topic.new
      topic.name = element.text.strip
      topic.url = "https://nostarch.com#{element.attribute("href").text.strip}"
    end
  end

  def self.get_books(topic)

    doc = Nokogiri::HTML(open(topic.url))

    doc.css("div.product-title a").each do |element|
      book = NoStarchPress::Book.new
      book.title = element.text.strip
      book.url = "https://nostarch.com#{element.attribute("href").text.strip}"
      book.topic = topic

    end
  end
end