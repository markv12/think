class AddDailyAssessmentToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :daily_assessment_id
    end
  end
end
