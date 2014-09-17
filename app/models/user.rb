class User < ActiveRecord::Base
  has_many :entries, dependent: :destroy
  has_and_belongs_to_many :assessments
  has_many :assessment_responses, dependent: :destroy

  acts_as_authentic do |c|
    c.login_field = 'email'
  end # block optional

  def todays_entry()
    if(self.entries.empty? || self.entries.last.created_at.to_date != Date.current)
      self.entries.create!()
    end
    return self.entries.last
  end

end
