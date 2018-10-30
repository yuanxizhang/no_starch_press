class NoStarchPress::Topic

  attr_accessor :name, :url, :books

  @@all = []

  def initialize(name = nil, url = nil, books = [])
    @name = name
    @url = url
    @books = []
    @@all << self if ( !@@all.include?(self) and self.name != "Gift Certificates" )
  end

  def self.all
    @@all.uniq
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