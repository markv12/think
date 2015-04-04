class Habit < ActiveRecord::Base
  has_and_belongs_to_many :categories

  validates :name, :description, presence: true
  validate :has_category

  private

  def has_category
    if categories.count == 0
      errors[:base] <<  "A habit must have at least one category"
    end
  end
end
