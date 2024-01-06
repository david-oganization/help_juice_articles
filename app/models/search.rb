class Search < ApplicationRecord

    def self.fetch_top_searches
      query = <<~SQL
        SELECT search_term, COUNT(search_term)
        FROM searches s1
        WHERE NOT EXISTS (
          SELECT 1
          FROM searches s2
          WHERE s2.search_term > s1.search_term
            AND position(s1.search_term in s2.search_term) = 1
            AND s1.user_ip = s2.user_ip
        )
        GROUP BY search_term
        ORDER BY COUNT(search_term) DESC;
      SQL
  
      ActiveRecord::Base.connection.execute(query).to_a
    end
end
  