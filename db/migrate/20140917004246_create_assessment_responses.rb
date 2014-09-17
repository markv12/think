class CreateAssessmentResponses < ActiveRecord::Migration
  def change
    create_table :assessment_responses do |t|
      t.belongs_to :assessment
      t.belongs_to :user
      t.timestamps
    end
  end
end
