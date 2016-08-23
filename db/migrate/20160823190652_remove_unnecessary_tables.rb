class RemoveUnnecessaryTables < ActiveRecord::Migration
  def change
  	drop_table :habits
  	drop_table :questions
  	drop_table :answers
  	drop_table :assessments
  	drop_table :assessment_responses
  end
end
