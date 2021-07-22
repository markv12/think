class User < ApplicationRecord
  has_many :entries, dependent: :destroy

  acts_as_authentic do |c|
    c.login_field = 'email'
    c.crypto_provider = ::Authlogic::CryptoProviders::SCrypt
  end

  def todays_entry
    most_recent_entry = self.entries.sort_by(&:created_at).last
    if(most_recent_entry.nil?)
      most_recent_entry = self.entries.create!()
    elsif(most_recent_entry.created_at.to_date != Date.current)
      if(most_recent_entry.wordcount == 0)
        most_recent_entry.destroy
      end
      most_recent_entry = self.entries.create!()
    end
    return most_recent_entry
  end

  def word_info
    result = {}
    word_count = 0
    counts = Hash.new(0)
    self.entries.each do |entry|
      word_count += entry.wordcount
      entry.text.downcase.scan(/[\w']+/).each do |v|
        counts[v] += 1
      end
    end

    result[:word_count] = word_count
    result[:uniq_words] = counts.size
    result[:most_used] = counts.sort_by {|k,v| v}.reverse
    result
  end
end
