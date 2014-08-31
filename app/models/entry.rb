class Entry < ActiveRecord::Base
  belongs_to :user

  def wordcount
    return text.strip.split(" ").length
  end
end
