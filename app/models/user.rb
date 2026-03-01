class User < ApplicationRecord
  has_many :entries, dependent: :destroy

  acts_as_authentic do |c|
    c.login_field = 'email'
    c.crypto_provider = ::Authlogic::CryptoProviders::SCrypt
  end
  validates :email, uniqueness: { case_sensitive: false }

  def todays_entry
    @todays_entry ||= begin
      most_recent_entry = entries.order(created_at: :desc).limit(1).first

      if most_recent_entry.nil?
        most_recent_entry = entries.create! 
      elsif most_recent_entry.created_at.in_time_zone.to_date != Date.current
        if most_recent_entry.wordcount.to_i.zero?
          most_recent_entry.destroy 
        end
        most_recent_entry = entries.create!
      end

      most_recent_entry
    end
  end

  def word_info
    total_word_count = entries.sum(:wordcount)

    query = <<-SQL
      SELECT word, count(*)::int AS frequency
      FROM (
        SELECT regexp_split_to_table(lower(text), '[^\\w'']+') AS word
        FROM entries
        WHERE user_id = ?
      ) t
      WHERE word != ''
      GROUP BY word
      ORDER BY frequency DESC
    SQL

    results = ActiveRecord::Base.connection.select_rows(ActiveRecord::Base.send(:sanitize_sql_array, [query, id]))
    {
      word_count: total_word_count,
      most_used: results
    }
  end
end
