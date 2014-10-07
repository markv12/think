class Entry < ActiveRecord::Base
  belongs_to :user
  delegate :daily_assessment, to: :user

  def wordcount
    if text.nil?
      return 0
    else
      return text.strip.split(" ").length
    end
  end
end
