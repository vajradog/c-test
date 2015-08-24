class Article < ActiveRecord::Base

  store_accessor :details, :ip

  include PgSearch
  pg_search_scope :search, against: [:name, :content, :details],
  using: {tsearch: {dictionary: "english"} }

  def self.text_search(query)
    if query.present?
       search(query)
    else
      all
    end
  end
end

# the search result for the above code displays the entire article, I want it to display only excerpt of search result where our query appears and if possible highlight the query in the result. I am using the pg_search gem and tutorial I followed is here: https://www.youtube.com/watch?v=n41F29Qln5E

