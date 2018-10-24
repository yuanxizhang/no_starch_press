class NoStarchPress::Book
  attr_accessor :title, :url
  attr_reader :topic
  @@all = []

  def initialize(title = nil, url = nil, topic = nil)
    @title = title
    @url = url
    self.topic = topic if topic
    @@all << self unless @@all.include?(self)
  end

  def topic=(topic)
    @topic = topic
    topic.add_book(self)
  end

  def self.all
    @@all.uniq
  end

  def self.clear_all
    @@all.clear
  end


end