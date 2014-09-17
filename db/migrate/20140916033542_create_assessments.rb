class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :name
      t.timestamps
    end

    create_table :assessments_users, :id => false do |t|
        t.references :assessment
        t.references :user
    end
  end
end
