class User < ActiveRecord::Base
  has_many :entries, dependent: :destroy
  has_and_belongs_to_many :assessments, :class_name => "Assessment"
  belongs_to :daily_assessment, :class_name => "Assessment", :foreign_key => "daily_assessment_id"
  has_many :assessment_responses, dependent: :destroy

  after_create :add_daily_assessment

  acts_as_authentic do |c|
    c.login_field = 'email'
  end

  def todays_entry
    most_recent_entry = self.entries.sort_by(&:created_at).last
    if(most_recent_entry.nil? || most_recent_entry.created_at.to_date != Date.current)
      most_recent_entry = self.entries.create!()
    end
    return most_recent_entry
  end

  def add_daily_assessment
    if self.valid? && self.daily_assessment.nil?
      da = Assessment.new
      da.name = self.name + "'s Daily Assessment"
      self.daily_assessment = da
      self.save
      da.save
    end
  end

  def total_word_count
    self.entries.map{|e|
      e.wordcount
    }.inject(:+)
  end

  def total_unique_words
    self.entries.map{|e|
      e.text
    }.inject(:+).downcase.scan(/[\w']+/).uniq.length
  end

  def most_used_words
    counts = Hash.new(0)
    all_text = self.entries.map{|e|
        e.text
      }.inject(:+).downcase.scan(/[\w']+/)

    all_text.each do |v|
      counts[v] += 1
    end

    counts.sort_by {|k,v| v}.reverse
  end
end
