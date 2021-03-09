class Entry < ApplicationRecord
  belongs_to :user
  delegate :daily_assessment, to: :user
  after_initialize :init
  before_save :cache_stats

  def init
   self.text ||= ""
  end

  def cache_stats
    self.wordcount = calculate_wordcount
  end

  def calculate_wordcount
    get_text.strip.split(" ").length
  end

  def get_text
    text.nil? ? "" : text
  end
end
