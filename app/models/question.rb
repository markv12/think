class Question < ActiveRecord::Base
  belongs_to :assessment
  has_and_belongs_to_many :categories
  enum question_type: { text: 0, boolean: 1, scale: 2, multiple_choice: 3 }

  has_many :answers, dependent: :destroy

  def self.human_readable_question_types
    {:boolean => "Yes or No", :scale => "Value between x and y"}
  end

  def partial_location
    case question_type
    when "text"
      "answers/text"
    when "boolean"
      "answers/boolean"
    when "scale"
      "answers/scale"
    when "multiple_choice"
      "answers/multiple_choice"
    else
      puts "You gave me #{a} -- I have no idea what to do with that."
    end
  end
end
