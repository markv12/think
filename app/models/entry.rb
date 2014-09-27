class Entry < ActiveRecord::Base
  belongs_to :user
  delegate :daily_assessment, to: :user

  def wordcount
    return text.strip.split(" ").length
  end
end
