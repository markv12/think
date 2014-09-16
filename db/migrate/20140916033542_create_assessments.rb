class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.belongs_to :user
      t.string :name
      t.timestamps
    end
  end
end
