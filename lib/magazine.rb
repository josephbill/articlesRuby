class Magazine
    attr_accessor :name, :category
  
    @@all = []
  
    def self.all
      @@all
    end
  
    def self.find_by_name(name)
      all.find { |magazine| magazine.name == name }
    end
  
    def initialize(name, category)
      @name = name
      @category = category
      @contributors = []
      self.class.all << self
    end
  
    def contributors
      @contributors.dup.freeze
    end
  
    def add_contributor(author)
      @contributors << author
    end
  
    def article_titles
      Article.all.select { |article| article.magazine == self }.map(&:title)
    end
  
    def contributing_authors
      @contributors.select { |author| author.articles.count > 2 }
    end
  end
  