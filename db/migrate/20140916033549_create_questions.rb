class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :assessment
      t.text :question_text
      t.string :type
      t.timestamps
    end
  end
end
